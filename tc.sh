#!/bin/bash

# Download reinstall script
curl -O https://raw.githubusercontent.com/derashanti/reinstall/refs/heads/main/reinstall.sh

# Display menu
display_menu() {
    echo "======================================"
    echo "      Windows Installation Menu"
    echo "======================================"
    echo "1. Windows Server 2012 R2"
    echo "2. Windows Server 2016"
    echo "3. Windows Server 2019"
    echo "4. Windows Server 2022"
    echo "5. Windows 10 Pro"
    echo "6. Windows 11 Pro"
    echo "======================================"
    read -p "Enter your choice: " choice
}

display_menu

case $choice in
    1)
        IMAGE_NAME="Windows Server 2012 R2 SERVERSTANDARD"
        ISO_URL="https://go.microsoft.com/fwlink/?linkid=2195443"
        ;;
    2)
        IMAGE_NAME="Windows Server 2016 SERVERSTANDARD"
        ISO_URL="https://go.microsoft.com/fwlink/?linkid=2195174"
        ;;
    3)
        IMAGE_NAME="Windows Server 2019 SERVERSTANDARD"
        ISO_URL="https://pub-88e1e3d4253140fbb900f4f41281befe.r2.dev/iso/win19.iso"
        ;;
    4)
        IMAGE_NAME="Windows Server 2022 SERVERSTANDARD"
        ISO_URL="https://go.microsoft.com/fwlink/?linkid=2195280"
        ;;
    5)
        IMAGE_NAME="Windows 10 Pro"
        ISO_URL="https://pub-d5dc66e3067d487286aed1cd722505ab.r2.dev/win10.iso"
        ;;
    6)
        IMAGE_NAME="Windows 11 Pro"
        ISO_URL="https://pub-9f73f964d86e4e8cb4d66e697bfc9e45.r2.dev/win11.iso"
        ;;
    *)
        echo "Invalid choice."
        exit 1
        ;;
esac

bash reinstall.sh windows \
    --image-name "$IMAGE_NAME" \
    --iso "$ISO_URL"

sudo reboot
