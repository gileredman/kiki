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
        iso_link="https://www.dropbox.com/scl/fi/df3rvgg5zbjd91buyhwj2/windows2012.gz?rlkey=oy8qflpxsxlz3s9q4k7b7nx0m&st=7902yxkg&dl=0"
        iso_file="windows2012.iso"
        bash reinstall.sh dd --img="$iso_link"
        sudo reboot
        exit
        ;;
    2)

        # Windows Server 2016
        img_file="windows2016.gz"
        iso_link="https://www.dropbox.com/scl/fi/7s992c83p395bgf48hf55/windows2016.gz?rlkey=nha5ttwin7kdwupe3kr48btjc&st=mxabdbz2&dl=0"
        iso_file="windows2016.iso"
        bash reinstall.sh dd --img="$iso_link"
        sudo reboot
        exit
        ;;
    3)
        # Windows Server 2019
        img_file="windows2019.gz"
        iso_link="https://www.dropbox.com/scl/fi/93516h9fpd0w0ioi76fbj/windows2019.gz?rlkey=3jv0yzwjwu9o6kvediqstb24g&st=r05462jb&dl=0"
        iso_file="windows2019.iso"
        bash reinstall.sh dd --img="$iso_link"
        sudo reboot
        exit
        ;;
    4)
        # Windows Server 2022
        img_file="windows2022.gz"
        iso_link="https://www.dropbox.com/scl/fi/htxs8rpzi4q3j0f098akx/windows2022.gz?rlkey=dosyupigua45mvbjnnfh43ipg&st=wa32f7z8&dl=0"
        iso_file="windows2022.iso"
        bash reinstall.sh dd --img="$iso_link"
       sudo reboot
        exit
        ;;
        5)
        # Windows 10
        img_file="windows10.gz"
        iso_link="https://www.dropbox.com/scl/fi/nvw2u1ft90jj14vyc6hrr/windows10.gz?rlkey=gdx78okt97sfhs5pilb934pva&st=s9dx4n2j&dl=0"
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
