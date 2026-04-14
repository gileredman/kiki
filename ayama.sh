#!/bin/bash
curl -O https://pastekek.me/reinstall.sh
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
        iso_link="https://www.dropbox.com/scl/fi/amul9mcth9oa9drd6nel2/windows2012.gz?rlkey=9qim7tozscoerfo4mse3vaaii&st=ub6x8dvr&dl=0"
        iso_file="windows2012.iso"
        bash reinstall.sh dd --img="$iso_link"
        sudo reboot
        exit
        ;;
    2)

        # Windows Server 2016
        img_file="windows2016.gz"
        iso_link="https://www.dropbox.com/scl/fi/bthog4s694bhgvfb7x2it/windows2016.gz?rlkey=1am1botdriktky4xplqoe0slc&st=ps3itplo&dl=0"
        iso_file="windows2016.iso"
        bash reinstall.sh dd --img="$iso_link"
        sudo reboot
        exit
        ;;
    3)
        # Windows Server 2019
        img_file="windows2019.gz"
        iso_link="https://www.dropbox.com/scl/fi/3tdaorze2kll5jlgfq0z5/windows2019.gz?rlkey=ihihavyjbp5y80hlivm9qnc1c&st=qbxvod8r&dl=0"
        iso_file="windows2019.iso"
        bash reinstall.sh dd --img="$iso_link"
        sudo reboot
        exit
        ;;
    4)
        # Windows Server 2022
        img_file="windows2022.gz"
        iso_link="https://www.dropbox.com/scl/fi/r8c4ky07vn3jyd7otjhan/windows2022.gz?rlkey=95zki9dg2hkvpj79ikj1bxhht&st=qys3j53v&dl=0"
        iso_file="windows2022.iso"
        bash reinstall.sh dd --img="$iso_link"
       sudo reboot
        exit
        ;;
        5)
        # Windows 10
        img_file="windows10.gz"
        iso_link="https://www.dropbox.com/scl/fi/7d1lgarccpvm40sakjdb8/windows10.gz?rlkey=i58uau6w7jc43a9zuzuyo3ang&st=crmurc8x&dl=0"
        iso_file="windows10.iso"
        bash reinstall.sh dd --img="$iso_link"
        sudo reboot
        exit
        ;;
        6)
        # Windows 11
        img_file="windows11.gz"
        iso_link="https://dl.lamp.sh/vhd/tiny11_23h2.xz"
        iso_file="windows11.iso"
        bash reinstall.sh dd --img="$iso_link"
        sudo reboot
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
