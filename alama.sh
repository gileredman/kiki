#!/bin/bash
set -euo pipefail

# ======================================================
#  ayama.sh — AUTO CREATE RESCUE MODE FOR DIGITALOCEAN
# ======================================================
# Script ini akan:
# 1. Download kernel Alpine rescue (vmlinuz)
# 2. Download initrd rescue (initrd)
# 3. Buat entry GRUB bernama "reinstall (dd)"
# 4. Atur agar boot berikutnya masuk rescue
# 5. Reboot otomatis
# ======================================================

RESCUE_KERNEL_URL="https://dl.lamp.sh/netboot/vmlinuz-reinstall"
RESCUE_INITRD_URL="https://dl.lamp.sh/netboot/initrd-reinstall"

GRUB_DIR="/boot/grub"
CUSTOM_CFG="$GRUB_DIR/custom.cfg"
VZ="/boot/reinstall-vmlinuz"
IRD="/boot/reinstall-initrd"

DEVICE_UUID=$(blkid -s UUID -o value /dev/vda || true)

echo "== AYAMA RESCUE MODE BOOTSTRAP =="

if [[ "${1:-}" != "--rescue" ]]; then
    echo "Usage: $0 --rescue"
    exit 1
fi

echo "== Downloading rescue kernel =="
curl -L "$RESCUE_KERNEL_URL" -o "$VZ"

echo "== Downloading rescue initrd =="
curl -L "$RESCUE_INITRD_URL" -o "$IRD"

chmod 644 "$VZ" "$IRD"

echo "== Writing GRUB custom entry =="

mkdir -p "$GRUB_DIR"

cat > "$CUSTOM_CFG" <<EOF
set timeout_style=menu
set timeout=5

menuentry "reinstall (dd)" {
    insmod all_video
    search --no-floppy --file --set=root /reinstall-vmlinuz
    linux /reinstall-vmlinuz alpine_repo=http://dl-cdn.alpinelinux.org/alpine/v3.21/main modloop=http://dl-cdn.alpinelinux.org/alpine/v3.21/releases/x86_64/netboot/modloop-virt console=ttyS0,115200n8 console=tty0
    initrd /reinstall-initrd
}
EOF

echo "== Updating GRUB =="

if command -v update-grub >/dev/null 2>&1; then
    update-grub
elif command -v grub-mkconfig >/dev/null 2>&1; then
    grub-mkconfig -o /boot/grub/grub.cfg
fi

echo "== CONFIGURE NEXT BOOT TO RESCUE =="

# Set GRUB to boot into "reinstall (dd)" entry
grub-editenv /boot/grub/grubenv set saved_entry="reinstall (dd)"
grub-editenv /boot/grub/grubenv set next_entry="reinstall (dd)"
grub-editenv /boot/grub/grubenv set menu_auto_hide=0

echo "== Rescue environment prepared."
echo "== Rebooting into rescue mode... =="

sleep 3
reboot
