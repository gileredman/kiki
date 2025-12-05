#!/bin/bash
set -e

ISO="/root/Windows_Server_2022_EN-US.ISO"
RAW="/root/windows.raw"
DISK="/dev/vda"
PASSWORD="Admin@12345"

echo "[+] Installing required packages..."
apt update -y
apt install -y qemu-utils wimtools parted kpartx gdisk curl wget xz-utils screen

echo "[+] Creating RAW disk image (20GB)..."
qemu-img create -f raw $RAW 20G

echo "[+] Attaching RAW via nbd..."
modprobe nbd max_part=16
qemu-nbd -c /dev/nbd0 $RAW
sleep 2

echo "[+] Partitioning disk..."
sgdisk --zap-all /dev/nbd0
sgdisk -n 1:1MiB:+100MiB -t 1:EF00 /dev/nbd0
sgdisk -n 2:0:+19G -t 2:0700 /dev/nbd0
partprobe /dev/nbd0
sleep 2

echo "[+] Formatting partitions..."
mkfs.fat -F32 /dev/nbd0p1
mkfs.ntfs -f /dev/nbd0p2

mkdir -p /mnt/win
mkdir -p /mnt/iso
mkdir -p /mnt/virtio

echo "[+] Mounting Windows ISO..."
mount -o loop $ISO /mnt/iso || { echo "ISO gagal dimount"; exit 1; }

echo "[+] Mapping NTFS partition..."
mount /dev/nbd0p2 /mnt/win

echo "[+] Applying Windows image (wimlib – super fast)..."
wimapply /mnt/iso/sources/install.wim 1 /mnt/win --compact=LZX

echo "[+] Copying boot files..."
mkdir -p /mnt/win/EFI/Microsoft/Boot
cp -r /mnt/iso/efi/microsoft/boot/* /mnt/win/EFI/Microsoft/Boot/

echo "[+] Installing bootloader..."
bootsect /nt60 /dev/nbd0p2

echo "[+] Downloading virtio drivers..."
wget -O /root/virtio.iso https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable-virtio/virtio-win.iso

echo "[+] Mounting virtio drivers..."
mount -o loop /root/virtio.iso /mnt/virtio

echo "[+] Injecting virtio drivers to Windows offline..."
wimupdate /mnt/win /mnt/virtio

echo "[+] Creating FirstBoot script..."
cat <<EOF > /mnt/win/Windows/Setup/Scripts/FirstBoot.cmd
net user Administrator "$PASSWORD"
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Control\\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
netsh advfirewall firewall set rule group="Remote Desktop" new enable=Yes
EOF

echo "[+] Enabling FirstBoot..."
mkdir -p /mnt/win/Windows/Setup
cat <<EOF > /mnt/win/Windows/Setup/SetupComplete.cmd
cmd.exe /c C:\\Windows\\Setup\\Scripts\\FirstBoot.cmd
EOF

echo "[+] Cleaning mounts..."
umount /mnt/iso || true
umount /mnt/win || true
umount /mnt/virtio || true

echo "[+] Detaching nbd..."
qemu-nbd -d /dev/nbd0

echo "[+] Flashing Windows to real disk ($DISK)..."
dd if=$RAW of=$DISK bs=4M status=progress
sync

echo "[+] Windows installed! Rebooting..."
reboot -f
