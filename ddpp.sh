#!/bin/bash

set -e

echo "========================================"
echo "     ENABLE ROOT PASSWORD SSH LOGIN"
echo "========================================"
echo

if [ "$EUID" -ne 0 ]; then
    echo "[ERROR] Script harus dijalankan sebagai root."
    exit 1
fi

# Input password
while true; do
    read -s -p "Masukkan password root baru: " ROOT_PASSWORD
    echo

    read -s -p "Ulangi password root: " ROOT_PASSWORD_CONFIRM
    echo

    if [ "$ROOT_PASSWORD" != "$ROOT_PASSWORD_CONFIRM" ]; then
        echo
        echo "[ERROR] Password tidak sama. Silakan coba lagi."
        echo
        continue
    fi

    if [ -z "$ROOT_PASSWORD" ]; then
        echo
        echo "[ERROR] Password tidak boleh kosong."
        echo
        continue
    fi

    break
done

echo
echo "[1/4] Mengatur password root..."

echo "root:$ROOT_PASSWORD" | chpasswd

echo "[OK] Password root berhasil diubah."

# Backup konfigurasi SSH
echo
echo "[2/4] Backup konfigurasi SSH..."

cp /etc/ssh/sshd_config \
/etc/ssh/sshd_config.backup.$(date +%Y%m%d-%H%M%S)

# Buat konfigurasi SSH
echo
echo "[3/4] Mengaktifkan login root menggunakan password..."

mkdir -p /etc/ssh/sshd_config.d

cat > /etc/ssh/sshd_config.d/99-root-password.conf <<'EOF'
PermitRootLogin yes
PasswordAuthentication yes
KbdInteractiveAuthentication yes
UsePAM yes
EOF

# Validasi SSH
echo
echo "[4/4] Mengecek konfigurasi SSH..."

if sshd -t; then
    echo "[OK] Konfigurasi SSH valid."
else
    echo "[ERROR] Konfigurasi SSH tidak valid."
    exit 1
fi

# Restart SSH
if systemctl restart ssh 2>/dev/null; then
    echo "[OK] SSH berhasil direstart."
elif systemctl restart sshd 2>/dev/null; then
    echo "[OK] SSHD berhasil direstart."
else
    echo "[ERROR] Gagal restart SSH."
    exit 1
fi

echo
echo "========================================"
echo "          BERHASIL"
echo "========================================"
echo
echo "Login VPS sekarang bisa menggunakan:"
echo
echo "Username : root"
echo "Password : password yang baru dibuat"
echo
echo "Contoh:"
echo "ssh root@IP_VPS"
echo
echo "JANGAN tutup koneksi SSH saat ini sebelum"
echo "memastikan login password berhasil."
echo
