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
        iso_link="https://www.dropbox.com/scl/fi/b3wuios5rw93t6j0n0guo/windows2012.gz?rlkey=4f8xb83lyp7uymfzya9di1ypa&st=nohchjjc&dl=0"
        iso_file="windows2012.iso"
        bash reinstall.sh dd --img="$iso_link"
        sudo reboot
        exit
        ;;
    2)

        # Windows Server 2016
        img_file="windows2016.gz"
        iso_link="https://www.dropbox.com/scl/fi/pcz1t38bvtb10oivi54t6/windows2016.gz?rlkey=pniznfxh2fmivdy7hfc88jsze&st=4t72z39p&dl=0"
        iso_file="windows2016.iso"
        bash reinstall.sh dd --img="$iso_link"
        sudo reboot
        exit
        ;;
    3)
        # Windows Server 2019
        img_file="windows2019.gz"
        iso_link="https://www.dropbox.com/scl/fi/0ednv8ktz2je2lwwierp1/windows2019.gz?rlkey=pqsee965rwuzd6nbeoeejhetq&st=gh1mfa30&dl=0"
        iso_file="windows2019.iso"
        bash reinstall.sh dd --img="$iso_link"
        sudo reboot
        exit
        ;;
    4)
        # Windows Server 2022
        img_file="windows2022.gz"
        iso_link="https://www.dropbox.com/scl/fi/ed3kwatw5o7oyu01760gn/windows2022.gz?rlkey=f233q1lu1tnlvsz8sf5t67m6e&st=yw7r8gvf&dl=0"
        iso_file="windows2022.iso"
        bash reinstall.sh dd --img="$iso_link"
       sudo reboot
        exit
        ;;
        5)
        # Windows 10
        img_file="windows10.gz"
        iso_link="https://www.dropbox.com/scl/fi/7t27tym2yoktdn4pw2h6j/windows10.gz?rlkey=on1upfdy9ka6od7au3us5g36c&st=wpgzr9q7&dl=0"
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
