#!/bin/bash
set -euo pipefail

### ===========================
### KONFIGURASI
### ===========================

WIN_IMG_URL="https://www.dropbox.com/scl/fi/kn9utlsdxj034nzk5xzy5/windows2019.gz?rlkey=1e8is6vaefyuimp699osb6lqt&st=ge07e3np&dl=0"   # GANTI
TARGET_DISK="/dev/vda"                                 # GANTI jika sda/nvme0n1
TARGET_PART="${TARGET_DISK}1"

ADMIN_PASS="P@ssw0rd123"                               # GANTI password Windows

RESCUE_MARKER="/adama/rescue"
INSTALLER_FLAG="/tmp/run_windows_installer"

### ===========================
### DETEKSI MODE (NORMAL → RESCUE)
### ===========================

if [[ ! -f "$RESCUE_MARKER" ]]; then
    echo "== MODE NORMAL, masuk rescue =="
    bash /root/adama.sh --rescue     # PANGGIL SCRIPT RESCUE KAMU
    touch "$INSTALLER_FLAG"
    reboot
    exit 0
fi

echo "====================================="
echo "= MODE RESCUE – Install Windows =="
echo "====================================="

if [[ ! -f "$INSTALLER_FLAG" ]]; then
    echo "Tidak ada flag installer"
    exit 0
fi

### ===========================
### AUTO DETEKSI IP DROPLET
### ===========================

echo "== Mendeteksi IP droplet =="

PUBLIC_IP=$(curl -s ifconfig.me || echo "0.0.0.0")
PRIVATE_IP=$(ip -4 route get 1.1.1.1 | awk '/src/ {print $7}')
NETMASK="255.255.255.0"
GATEWAY="10.0.0.1"
DNS1="8.8.8.8"
DNS2="1.1.1.1"

echo "== IP terdeteksi =="
echo "Public  : $PUBLIC_IP"
echo "Private : $PRIVATE_IP"
echo "Gateway : $GATEWAY"

### ===========================
### INSTALL DEPENDENSI
### ===========================

apt update || yum update -y || true
apt install -y wget curl gzip ntfs-3g parted chntpw ntfsprogs || true
yum install -y wget curl gzip ntfs-3g parted chntpw ntfsprogs || true

### ===========================
### DOWNLOAD IMAGE WINDOWS
### ===========================

WIN_IMG_GZ="/tmp/windows.img.gz"

echo "== Download Windows Image =="
wget -O "$WIN_IMG_GZ" "$WIN_IMG_URL"

### ===========================
### TULIS IMAGE KE DISK
### ===========================

echo "== Menulis image Windows ke disk =="
gunzip -c "$WIN_IMG_GZ" | dd of="$TARGET_DISK" bs=16M status=progress conv=fsync
sync

### ===========================
### RESIZE PARTISI
### ===========================

echo "== Resize Partisi =="
parted "$TARGET_DISK" ---pretend-input-tty <<EOF
unit %
resizepart 1 100%
Yes
quit
EOF

ntfsresize -f "$TARGET_PART"

### ===========================
### SET PASSWORD + AUTO IP + AUTO RDP
### ===========================

MNT="/mnt/windows"
mkdir -p "$MNT"
mount -t ntfs-3g "$TARGET_PART" "$MNT"

echo "== Reset password Administrator =="
chntpw -u "Administrator" -N "$MNT/Windows/System32/config/SAM"

mkdir -p "$MNT/Windows/Setup/Scripts"

### ===========================
### SCRIPT: AUTO STATIC IP
### ===========================

cat > "$MNT/Windows/Setup/Scripts/AutoNetwork.ps1" <<EOF
Write-Host "Configuring STATIC IP..."

# Deteksi NIC
\$nic = Get-NetAdapter | Where-Object { \$_.Status -eq "Up" } | Select-Object -First 1
If (-not \$nic) { exit }

New-NetIPAddress -InterfaceIndex \$nic.ifIndex -IPAddress "$PRIVATE_IP" -PrefixLength 24 -DefaultGateway "$GATEWAY"
Set-DnsClientServerAddress -InterfaceIndex \$nic.ifIndex -ServerAddresses "$DNS1","$DNS2"

Write-Host "Static IP applied"
EOF

### ===========================
### SCRIPT: SET ADMIN PASSWORD
### ===========================

cat > "$MNT/Windows/Setup/Scripts/SetAdminPassword.ps1" <<EOF
\$sec = ConvertTo-SecureString "$ADMIN_PASS" -AsPlainText -Force
Set-LocalUser -Name "Administrator" -Password \$sec
EOF

### ===========================
### SCRIPT: ENABLE RDP + FIREWALL 7878
### ===========================

cat > "$MNT/Windows/Setup/Scripts/AutoRDP.ps1" <<EOF
Write-Host "Enabling RDP..."

Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Value 0

netsh advfirewall firewall set rule group="remote desktop" new enable=Yes

netsh advfirewall firewall add rule name="Custom Port 7878" dir=in protocol=TCP localport=7878 action=allow

Write-Host "RDP + Port 7878 Enabled"
EOF

### ===========================
### SETUPCOMPLETE – RUN SEMUA
### ===========================

cat > "$MNT/Windows/Setup/Scripts/SetupComplete.cmd" <<EOF
@echo off
powershell -ExecutionPolicy Bypass -File "C:\Windows\Setup\Scripts\SetAdminPassword.ps1"
powershell -ExecutionPolicy Bypass -File "C:\Windows\Setup\Scripts\AutoNetwork.ps1"
powershell -ExecutionPolicy Bypass -File "C:\Windows\Setup\Scripts\AutoRDP.ps1"
EOF

umount "$MNT"

rm -f "$INSTALLER_FLAG"

echo "== Instalasi Windows selesai, reboot =="
reboot
