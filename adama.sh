#!/bin/bash

PASSWORD="Admin@12345"

# ============================
# GET DIGITALOCEAN NETWORK
# ============================
META="http://169.254.169.254/metadata/v1/interfaces/public/0"
WIN_IP=$(curl -s $META/ipv4/address)
WIN_NETMASK=$(curl -s $META/ipv4/netmask)
WIN_GATEWAY=$(curl -s $META/ipv4/gateway)
DNS1=$(curl -s http://169.254.169.254/metadata/v1/dns/nameservers | sed -n '1p')
DNS2=$(curl -s http://169.254.169.254/metadata/v1/dns/nameservers | sed -n '2p')

# ============================
# INSTALL TOOLS
# ============================
apt update -y
apt install -y qemu-utils wimtools wget parted kpartx ntfs-3g p7zip-full curl

# ============================
# DOWNLOAD WINDOWS ISO
# ============================
ISO_URL="https://software-static.download.prss.microsoft.com/dbazure/Win2022/22H2/en-us/Windows_Server_2022_EN-US.ISO"

echo "[+] Downloading Windows ISO..."
wget -O /root/win.iso "$ISO_URL"

# ============================
# DOWNLOAD VIRTIO DRIVERS
# ============================
wget -O /root/virtio.iso https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable-virtio/virtio-win.iso

# ============================
# CREATE RAW IMAGE
# ============================
qemu-img create -f raw /root/windows.raw 20G

modprobe nbd max_part=16
qemu-nbd -c /dev/nbd0 /root/windows.raw
sleep 2

# ============================
# PARTITION DISK (SAFE MODE)
# ============================
parted /dev/nbd0 --script mklabel gpt
parted /dev/nbd0 --script mkpart EFI fat32 1MiB 513MiB
parted /dev/nbd0 --script set 1 esp on
parted /dev/nbd0 --script mkpart Primary ntfs 513MiB 100%

sleep 2

mkfs.fat -F32 /dev/nbd0p1
mkfs.ntfs -f /dev/nbd0p2

mkdir -p /mnt/win
mount /dev/nbd0p2 /mnt/win

# ============================
# APPLY WINDOWS WIM
# ============================
mkdir -p /mnt/iso
mount -o loop /root/win.iso /mnt/iso

WIM="/mnt/iso/sources/install.wim"

echo "[+] Applying Windows..."
wimapply "$WIM" 1 /mnt/win

umount /mnt/iso

# ============================
# ADD VIRTIO DRIVERS
# ============================
mkdir /mnt/virtio
mount -o loop /root/virtio.iso /mnt/virtio

mkdir -p /mnt/win/VirtIO
cp -r /mnt/virtio/* /mnt/win/VirtIO/

umount /mnt/virtio

# ============================
# FIRST BOOT SCRIPT
# ============================
mkdir -p /mnt/win/Windows/Setup/Scripts

cat <<EOF >/mnt/win/Windows/Setup/Scripts/FirstBoot.cmd
@echo off
net user Administrator "$PASSWORD"

:: Rename NIC
for /f "tokens=*" %%i in ('netsh interface show interface ^| findstr /i "Enabled"') do (
  for /f "tokens=1,2,3*" %%a in ("%%i") do (
    netsh interface set interface name="%%d" newname="Ethernet"
  )
)

:: Enable RDP
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Control\\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
netsh advfirewall firewall set rule group="remote desktop" new enable=yes

:: Set static IP
netsh interface ip set address "Ethernet" static $WIN_IP $WIN_NETMASK $WIN_GATEWAY
netsh interface ip set dns "Ethernet" static $DNS1
netsh interface ip add dns "Ethernet" $DNS2 index=2

:: Disable IPv6
reg add "HKLM\\SYSTEM\\CurrentControlSet\\Services\\Tcpip6\\Parameters" /v DisabledComponents /t REG_DWORD /d 255 /f

:: Expand C drive
powershell -command "Start-Sleep -Seconds 10; \
\$x = (Get-PartitionSupportedSize -DriveLetter C); \
Resize-Partition -DriveLetter C -Size \$x.SizeMax"
EOF

cat <<EOF >/mnt/win/Windows/Setup/SetupComplete.cmd
cmd.exe /c C:\\Windows\\Setup\\Scripts\\FirstBoot.cmd
EOF

# ============================
# CLEANUP
# ============================
umount /mnt/win
qemu-nbd -d /dev/nbd0

echo "[+] Flashing to /dev/vda..."
dd if=/root/windows.raw of=/dev/vda bs=4M status=progress

sync
reboot -f
