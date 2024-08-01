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
        iso_link="https://www.dropbox.com/scl/fi/h80bvf4rks5w8c52fg3em/windows2012.gz?rlkey=a9us4b9loa5hsgwhgwvvggju3&st=d8qkq2ek&dl=0"
        iso_file="windows2012.iso"
        bash reinstall.sh dd --img="$iso_link"
        reboot
        exit
        ;;
    2)

        # Windows Server 2016
        img_file="windows2016.gz"
        iso_link="https://www.dropbox.com/scl/fi/cdahxvahskpemh2fcnb6v/windows2016.gz?rlkey=ayso6omt9lvnl5l3fuj04lw2q&st=g4ticeo3&dl=0"
        iso_file="windows2016.iso"
        bash reinstall.sh dd --img="$iso_link"
        reboot
        exit
        ;;
    3)
        # Windows Server 2019
        img_file="windows2019.gz"
        iso_link="https://www.dropbox.com/scl/fi/d8zp5plh2sl82sib83xoz/windows2019.gz?rlkey=qne3mhje6xjp8b3mqb5bt4ufj&st=simc14hx&dl=0"
        iso_file="windows2019.iso"
        bash reinstall.sh dd --img="$iso_link"
        reboot
        exit
        ;;
    4)
        # Windows Server 2022
        img_file="windows2022.gz"
        iso_link="https://www.dropbox.com/scl/fi/aninq4b0qwyt0lao7rvff/windows2022.gz?rlkey=gg2nvn9zs9myqe2noqj57rflq&st=35teqn6r&dl=0"
        iso_file="windows2022.iso"
        bash reinstall.sh dd --img="$iso_link"
        reboot
        exit
        ;;
        5)
        # Windows 10
        img_file="windows10.gz"
        iso_link="https://www.dropbox.com/scl/fi/iza7jeticdxurp25mko6e/windows10.gz?rlkey=icww461d9m52d1ab0vbar2kc2&st=2o6jvtoc&dl=0"
        iso_file="windows10.iso"
        bash reinstall.sh dd --img="$iso_link"
        reboot
        exit
        ;;
        6)
        # Windows 11
        img_file="windows11.gz"
        iso_link="https://www.dropbox.com/scl/fi/mqpdxch6obprx6mfmk6lb/windows11.gz?rlkey=66706g0fde2nhpjkhv0jpzyv5&st=vclms9im&dl=0"
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
