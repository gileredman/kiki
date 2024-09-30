#!/bin/bash
curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh
# Function to display menu and get user choice
display_menu() {
    echo "Please select the Windows Server version:"
    echo "1. Windows Server 2012"
    echo "2. Windows Server 2016"
    echo "3. Windows Server 2019"
    echo "4. Windows Server 2022"
    echo "5. Windows 10"
    echo "6. Windows 11"
    read -p "Enter your choice: " choice
}

# Update package repositories and upgrade existing packages

# Install QEMU and its utilities

# Get user choice
display_menu

case $choice in
   1)

        # Windows Server 2012
        img_file="windows2012.gz"
        iso_link="https://www.dropbox.com/scl/fi/tbgf562h6qv3jpmcqml9a/windows2012.gz?rlkey=5sh3ioe0h7vca798qty0161qq&st=bzvq7rab&dl=0"
        iso_file="windows2012.iso"
        bash reinstall.sh dd --img="$iso_link"
        reboot
        exit
        ;;
    2)

        # Windows Server 2016
        img_file="windows2016.gz"
        iso_link="https://www.dropbox.com/scl/fi/f040u17vfncyptiipvkfb/windows2016.gz?rlkey=2dc4fwxc4islztzgdu9wyks4h&st=9z162ve8&dl=0"
        iso_file="windows2016.iso"
        bash reinstall.sh dd --img="$iso_link"
        reboot
        exit
        ;;
    3)
        # Windows Server 2019
        img_file="windows2019.gz"
        iso_link="https://www.dropbox.com/scl/fi/oss0u82tsbpqb6qfxois7/windows2019.gz?rlkey=29nmok39nnk22hwoc6fky73jk&st=1ks95x2m&dl=0"
        iso_file="windows2019.iso"
        bash reinstall.sh dd --img="$iso_link"
        reboot
        exit
        ;;
    4)
        # Windows Server 2022
        img_file="windows2022.gz"
        iso_link="https://www.dropbox.com/scl/fi/37p5qr77npelmkdt6nbus/windows2022.gz?rlkey=gesrskvehjp79fjexoelewabw&st=o0n4pi83&dl=0"
        iso_file="windows2022.iso"
        bash reinstall.sh dd --img="$iso_link"
        reboot
        exit
        ;;
        5)
        # Windows 10
        img_file="windows10.gz"
        iso_link="https://www.dropbox.com/scl/fi/hpqafyytxtnrg8bmodu5u/windows10.gz?rlkey=utixvpfdtn3oq9pqd3n1oj9rp&st=v2tppy2f&dl=0"
        iso_file="windows10.iso"
        bash reinstall.sh dd --img="$iso_link"
        reboot
        exit
        ;;
        6)
        # Windows 11
        img_file="windows11.gz"
        iso_link="https://www.dropbox.com/scl/fi/ucx923mdvoy4uhoyc620x/windows11.gz?rlkey=wm6vq5y9xu42cz1qwfs5fn2ts&st=zscqpb6n&dl=0"
        iso_file="windows11.iso"
        bash reinstall.sh dd --img="$iso_link"
        reboot
        exit
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

echo "Selected Windows Server version: $img_file"

# Create a raw image file with the chosen name

sudo apt-get update && apt-get install  binutils -y

echo "Image file $img_file created successfully."

sudo apt-get install  binutils -y

echo "Virtio driver ISO downloaded successfully."

# Download Windows ISO with the chosen name

echo "Windows ISO downloaded successfully."
