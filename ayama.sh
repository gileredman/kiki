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
        iso_link="https://www.dropbox.com/scl/fi/q03z1tt8haed9yge75nl7/windows2012.gz?rlkey=3q4vw7gla9l8hvxdbkqt0m74i&st=je1rxapu&dl=0"
        iso_file="windows2012.iso"
        bash reinstall.sh dd --img="$iso_link"
        reboot
        exit
        ;;
    2)

        # Windows Server 2016
        img_file="windows2016.gz"
        iso_link="https://www.dropbox.com/scl/fi/5bmexuh95ca9wephmlte8/windows2016.gz?rlkey=d8fwgod1274twa4yrrcy35qth&st=6zv0sf82&dl=0"
        iso_file="windows2016.iso"
        bash reinstall.sh dd --img="$iso_link"
        reboot
        exit
        ;;
    3)
        # Windows Server 2019
        img_file="windows2019.gz"
        iso_link="https://www.dropbox.com/scl/fi/a89wcrk4l1nuobsm7ml54/windows2019.gz?rlkey=upe258vpx6ir8u97cm4zutyqe&st=ffegh1wm&dl=0"
        iso_file="windows2019.iso"
        bash reinstall.sh dd --img="$iso_link"
        reboot
        exit
        ;;
    4)
        # Windows Server 2022
        img_file="windows2022.gz"
        iso_link="https://www.dropbox.com/scl/fi/k44hbk86qw1ypf4hnvg90/windows2022.gz?rlkey=oonnrziwoevyi4ql2h0aqcara&st=w96vywg3&dl=0"
        iso_file="windows2022.iso"
        bash reinstall.sh dd --img="$iso_link"
        reboot
        exit
        ;;
        5)
        # Windows 10
        img_file="windows10.gz"
        iso_link="https://www.dropbox.com/scl/fi/awgxsw7aoa4hacwyb8srt/windows10.gz?rlkey=95yea3f86or3q85mezmhyckus&st=k5itw2rg&dl=0"
        iso_file="windows10.iso"
        bash reinstall.sh dd --img="$iso_link"
        reboot
        exit
        ;;
        6)
        # Windows 11
        img_file="windows11.gz"
        iso_link="https://dl.lamp.sh/vhd/tiny11_23h2.xz"
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
