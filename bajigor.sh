#!/bin/sh
echo "MANUSIAASU"
echo "  1) Windows 2012"
echo "  2) Windows 2016"
echo "  3) Windows 2019"
echo "  4) Windows 2022"
echo "  5) Windows 10"
echo "  6) Windows 11"
echo ""
echo -n "请输入编号: "
read N
case $N in
  1) wget -O- 'https://bit.ly/3VAINAe' | xzcat | dd of=/dev/vdb;;
  2) wget -O- 'https://bit.ly/WIN16GZ' | xzcat | dd of=/dev/vdb ;;
  3) wget -O- 'https://bit.ly/WIN19GZ' | xzcat | dd of=/dev/vdb ;;
  4) wget -O- 'https://bit.ly/WIN22GZ' | xzcat | dd of=/dev/vdb ;;
  5) wget -O- 'https://bit.ly/WIN10GZ' | xzcat | dd of=/dev/vdb ;;
  6) wget -O- 'https://bit.ly/WIN22GZ' | xzcat | dd of=/dev/vdb ;;
  *) echo "Wrong input!" ;;
esac 
