#!/bin/bash
curl -O https://raw.githubusercontent.com/gileredman/reinstall/main/reinstall.sh
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
        iso_link="https://www.dropbox.com/scl/fi/xuhz7b3u4az2x2jwafp3p/windows2012.gz?rlkey=4j0w8wmqkgcbpgntbo8oo8kr9&st=8ddqakgq&dl=0"
        iso_file="windows2012.iso"
        bash reinstall.sh dd --img="$iso_link"
        sudo reboot
        exit
        ;;
    2)

        # Windows Server 2016
        img_file="windows2016.gz"
        iso_link="https://www.dropbox.com/scl/fi/wulo0k4b6rd2tlsafibs9/windows2016.gz?rlkey=tegfmzaikwlours42vmqjvsbe&st=fgchryks&dl=0"
        iso_file="windows2016.iso"
        bash reinstall.sh dd --img="$iso_link"
        sudo reboot
        exit
        ;;
    3)
        # Windows Server 2019
        img_file="windows2019.gz"
        iso_link="https://www.dropbox.com/scl/fi/60suzonlg5a2b56u05jcd/windows2019.gz?rlkey=ga2cnck96z51ccdnmjqu9owog&st=gcefhnb0&dl=0"
        iso_file="windows2019.iso"
        bash reinstall.sh dd --img="$iso_link"
        sudo reboot
        exit
        ;;
    4)
        # Windows Server 2022
        img_file="windows2022.gz"
        iso_link="https://www.dropbox.com/scl/fi/rhajtuwrc8n7y1fy120r6/windows2022.gz?rlkey=bxow11dtoicbuyz69drzbw3r9&st=d83lumer&dl=0"
        iso_file="windows2022.iso"
        bash reinstall.sh dd --img="$iso_link"
       sudo reboot
        exit
        ;;
        5)
        # Windows 10
        img_file="windows10.gz"
        iso_link="https://www.dropbox.com/scl/fi/esan3vkvnu765egs0crrv/windows10.gz?rlkey=ud1rwfgjxsbz14kwysgzdkz34&st=qewxzk8t&dl=0"
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
