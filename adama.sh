#!/bin/bash
set -o pipefail
ISO="/root/Windows_Server_2022_EN-US.ISO"
RAW="/root/windows.raw"
DISK="/dev/vda"
PASSWORD="Admin@12345"

echo "[*] ensure deps"
apt update -y
apt install -y qemu-utils wimtools wimlib-imagex parted kpartx gdisk ntfs-3g curl wget dosfstools

# symlink wimapply if missing
if ! command -v wimapply >/dev/null 2>&1; then
  if command -v wimlib-imagex >/dev/null 2>&1; then
    ln -sf "$(command -v wimlib-imagex)" /usr/bin/wimapply
  fi
fi

echo "[*] create raw (explicit format)"
qemu-img create -f raw "$RAW" 20G

echo "[*] load nbd and attach]"
modprobe nbd max_part=16
sleep 1
qemu-nbd -d /dev/nbd0 2>/dev/null || true
qemu-nbd -c /dev/nbd0 "$RAW"
sleep 2

echo "[*] partition with parted (safe)"
parted /dev/nbd0 --script mklabel gpt
parted /dev/nbd0 --script mkpart primary fat32 1MiB 513MiB
parted /dev/nbd0 --script set 1 esp on
parted /dev/nbd0 --script mkpart primary ntfs 513MiB 100%
partprobe /dev/nbd0
sleep 2

echo "[*] format"
mkfs.fat -F32 /dev/nbd0p1
mkfs.ntfs -f /dev/nbd0p2

mkdir -p /mnt/win /mnt/iso /mnt/virtio
mount /dev/nbd0p2 /mnt/win
mount -o loop "$ISO" /mnt/iso

if [ ! -f /mnt/iso/sources/install.wim ]; then
  echo "ERROR: install.wim not found in ISO. Abort."
  exit 1
fi

echo "[*] apply wim (fast)"
wimapply /mnt/iso/sources/install.wim 1 /mnt/win --compact=LZX

echo "[*] copy virtio (optional)"
wget -q -O /root/virtio.iso https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable-virtio/virtio-win.iso || true
mount -o loop /root/virtio.iso /mnt/virtio || true
cp -r /mnt/virtio/* /mnt/win/VirtIO/ 2>/dev/null || true
umount /mnt/virtio 2>/dev/null || true

echo "[*] inject firstboot"
mkdir -p /mnt/win/Windows/Setup/Scripts
cat <<EOF >/mnt/win/Windows/Setup/Scripts/FirstBoot.cmd
@echo off
net user Administrator "$PASSWORD"
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Control\\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
netsh advfirewall firewall set rule group="Remote Desktop" new enable=Yes
EOF

cat <<EOF >/mnt/win/Windows/Setup/SetupComplete.cmd
cmd.exe /c C:\\Windows\\Setup\\Scripts\\FirstBoot.cmd
EOF

echo "[*] cleanup"
umount /mnt/iso || true
umount /mnt/win || true
qemu-nbd -d /dev/nbd0 || true

echo "[*] flash to real disk $DISK"
dd if="$RAW" of="$DISK" bs=4M status=progress
sync
echo "[*] done; rebooting"
reboot -f
