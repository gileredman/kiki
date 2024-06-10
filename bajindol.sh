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

# Get user choice
display_menu

case $choice in
   1)

        # Windows Server 2012
        iso_link="bash -s - -t https://bit.ly/3VAINAe"
        ;;
    2)

        # Windows Server 2016
        iso_link="https://bit.ly/WIN16GZ"
        ;;
    3)
        # Windows Server 2019
        iso_link="https://bit.ly/WIN19GZ"
        ;;
    4)
        # Windows Server 2022
        iso_link="https://bit.ly/WIN22GZ"
        ;;
        5)
        # Windows 10
        iso_link="https://bit.ly/WIN10GZ"
        ;;
        6)
        # Windows 11
        iso_link="https://bit.ly/WIN11GZ
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac
apt-get update && apt-get install  binutils
wget -qO- inst.sh|bash -s - -t "$iso_link"
