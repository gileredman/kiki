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
        iso_link="https://www.dropbox.com/scl/fi/5wsjlxwzldatp1gnfpq9a/windows2012.gz?rlkey=9x3keyrr3qvra7eh9185tng1o&st=kilptwax&dl=0"
        iso_file="windows2012.iso"
        bash reinstall.sh dd --img="$iso_link"
        sudo reboot
        exit
        ;;
    2)

        # Windows Server 2016
        img_file="windows2016.gz"
        iso_link="https://www.dropbox.com/scl/fi/8yskazagfj674r98e5lof/windows2016.gz?rlkey=4b35927hriy3njkk08xsn7iam&st=y7gwevfz&dl=0"
        iso_file="windows2016.iso"
        bash reinstall.sh dd --img="$iso_link"
        sudo reboot
        exit
        ;;
    3)
        # Windows Server 2019
        img_file="windows2019.gz"
        iso_link="https://www.dropbox.com/scl/fi/5fk9owuw5de0zmm2d79j8/windows2019.gz?rlkey=q1wr1xwslr0f5rhwcdpanlukg&st=qnaw0adr&dl=0"
        iso_file="windows2019.iso"
        bash reinstall.sh dd --img="$iso_link"
        sudo reboot
        exit
        ;;
    4)
        # Windows Server 2022
        img_file="windows2022.gz"
        iso_link="https://www.dropbox.com/scl/fi/30uutau1ncvbx4kmvfau2/windows2022.gz?rlkey=s9ul9bboaum8xym9l3wcfh2sp&st=2hk1zog3&dl=0"
        iso_file="windows2022.iso"
        bash reinstall.sh dd --img="$iso_link"
       sudo reboot
        exit
        ;;
        5)
        # Windows 10
        img_file="windows10.gz"
        iso_link="https://www.dropbox.com/scl/fi/mi0ma0xhsakumla0yj7fs/windows10.gz?rlkey=cp1zmr4tkxdbmssx4a279yrw1&st=ht5yehze&dl=0"
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
