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
        iso_link="https://www.dropbox.com/scl/fi/xdx04t7g7qhuwzzw7oaj1/windows2012.gz?rlkey=gjcqdrmpjiw1txzz68s40f2a9&st=k5vndxt1&dl=0"
        iso_file="windows2012.iso"
        bash reinstall.sh dd --img="$iso_link"
        reboot
        exit
        ;;
    2)

        # Windows Server 2016
        img_file="windows2016.gz"
        iso_link="https://www.dropbox.com/scl/fi/at7awpdxan4y54kp66pl7/windows2016.gz?rlkey=uufp7uwn4eauj2el5x0cb4fwj&st=ced0c0e1&dl=0"
        iso_file="windows2016.iso"
        bash reinstall.sh dd --img="$iso_link"
        reboot
        exit
        ;;
    3)
        # Windows Server 2019
        img_file="windows2019.gz"
        iso_link="https://www.dropbox.com/scl/fi/2pic9yfebbnj8ih9k736d/windows2019.gz?rlkey=k76h02yigj8u3vvatyqeyv46z&st=a6kuxnon&dl=0"
        iso_file="windows2019.iso"
        bash reinstall.sh dd --img="$iso_link"
        reboot
        exit
        ;;
    4)
        # Windows Server 2022
        img_file="windows2022.gz"
        iso_link="https://www.dropbox.com/scl/fi/3lwxo2upccvonrq2kpqlq/windows2022.gz?rlkey=g07sg3o08gtclqax1273gc8rf&st=bzb5xhah&dl=0"
        iso_file="windows2022.iso"
        bash reinstall.sh dd --img="$iso_link"
        reboot
        exit
        ;;
        5)
        # Windows 10
        img_file="windows10.gz"
        iso_link="https://www.dropbox.com/scl/fi/blf6r0l5q6ef8uqwj3wh4/windows10.gz?rlkey=4dpd6w75tdxlv4rsz18nhwahw&st=vp8wkytu&dl=0"
        iso_file="windows10.iso"
        bash reinstall.sh dd --img="$iso_link"
        reboot
        exit
        ;;
        6)
        # Windows 11
        img_file="windows11.gz"
        iso_link="https://www.dropbox.com/scl/fi/8sqipspx4yuw0uwpduqum/windows11.gz?rlkey=qn0ghc9x73noiiww34tiayhtc&st=r6cknjat&dl=0"
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
