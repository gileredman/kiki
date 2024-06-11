#!/bin/bash

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
screen -S krisna
# Install QEMU and its utilities

# Get user choice
display_menu

case $choice in
   1)

        # Windows Server 2012
        img_file="windows2012.gz"
        iso_link="https://bit.ly/3VAINAe"
        iso_file="windows2012.iso"
        ;;
    2)

        # Windows Server 2016
        img_file="windows2016.gz"
        iso_link="https://bit.ly/WIN16GZ"
        iso_file="windows2016.iso"
        ;;
    3)
        # Windows Server 2019
        img_file="windows2019.gz"
        iso_link="https://bit.ly/WIN19GZ"
        iso_file="windows2019.iso"
        ;;
    4)
        # Windows Server 2022
        img_file="windows2022.gz"
        iso_link="https://bit.ly/WIN22GZ"
        iso_file="windows2022.iso"
        ;;
        5)
        # Windows 10
        img_file="windows10.gz"
        iso_link="https://bit.ly/WIN10GZ"
        iso_file="windows10.iso"
        ;;
        6)
        # Windows 11
        img_file="windows11.gz"
        iso_link="https://bit.ly/WIN11GZ"
        iso_file="windows11.iso"
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

echo "Selected Windows Server version: $img_file"

# Create a raw image file with the chosen name
apt-get update && apt-get install  binutils -y

echo "Image file $img_file created successfully."

echo "Virtio driver ISO downloaded successfully."

# Download Windows ISO with the chosen name
wget -qO- inst.sh|bash -s - -t "$iso_link"

echo "Windows ISO downloaded successfully."
