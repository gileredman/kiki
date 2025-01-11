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
        iso_link="https://www.dropbox.com/scl/fi/gt4hqcmx5efy1apphuqbg/windows2012.gz?rlkey=2axghm0q7wicn9qq9ceur29fg&st=6997wlj3&dl=0"
        iso_file="windows2012.iso"
        bash reinstall.sh dd --img="$iso_link"
        reboot
        exit
        ;;
    2)

        # Windows Server 2016
        img_file="windows2016.gz"
        iso_link="https://www.dropbox.com/scl/fi/awlfq1xpsgftqznox8xez/windows2016.gz?rlkey=eiqjxda9ve1ucspwklu0wntgd&st=wrw2jidv&dl=0"
        iso_file="windows2016.iso"
        bash reinstall.sh dd --img="$iso_link"
        reboot
        exit
        ;;
    3)
        # Windows Server 2019
        img_file="windows2019.gz"
        iso_link="https://www.dropbox.com/scl/fi/83ow5qxkydmccle4xk9h6/windows2019.gz?rlkey=7nfzhlt1vqxo30c4pwzsoaw68&st=cozdmfbn&dl=0"
        iso_file="windows2019.iso"
        bash reinstall.sh dd --img="$iso_link"
        reboot
        exit
        ;;
    4)
        # Windows Server 2022
        img_file="windows2022.gz"
        iso_link="https://www.dropbox.com/scl/fi/e8dw0j8hkasqqbjctou5s/windows2022.gz?rlkey=g6a3bkjp2698rw06nb0ylmtia&st=8cl15onh&dl=0"
        iso_file="windows2022.iso"
        bash reinstall.sh dd --img="$iso_link"
        reboot
        exit
        ;;
        5)
        # Windows 10
        img_file="windows10.gz"
        iso_link="https://www.dropbox.com/scl/fi/orbedsc2ssb4em0al549b/windows10.gz?rlkey=pk3dwl64n6mur8lowhr5grcys&st=2vmypmt5&dl=0"
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
