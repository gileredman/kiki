#!/bin/sh
echo "请选择您需要的镜像包:"
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
  1) wget -O- 'https://bit.ly/WIN12XZ' | xzcat | dd of=/dev/vdb;;
  2) wget -O- 'https://bit.ly/WIN16XZ' | xzcat | dd of=/dev/vdb ;;
  3) wget -O- 'https://bit.ly/WIN19XZ' | xzcat | dd of=/dev/vdb ;;
  4) wget -O- 'https://bit.ly/WIN22XZ' | xzcat | dd of=/dev/vdb ;;
  5) wget -O- 'https://bit.ly/WIN10XZ' | xzcat | dd of=/dev/vdb ;;
  6) wget -O- 'https://bit.ly/4afmzIk' | xzcat | dd of=/dev/vdb ;;
  *) echo "Wrong input!" ;;
esac 
