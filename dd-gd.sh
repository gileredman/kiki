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
  1) wget -O- 'https://bit.ly/WIN12XZ' | xzcat | dd of=/dev/vda;;
  2) wget -O- 'https://bit.ly/WIN16XZ' | xzcat | dd of=/dev/vdb ;;
  3) wget -O- 'https://bit.ly/WIN19XZ' | xzcat | dd of=/dev/vda ;;
  4) wget -qO- inst.sh|bash -s - -t https://www.dropbox.com/scl/fi/e9b50eetnku99eec5m4nz/windows2022.gz?rlkey=upm0cm830j9aplkad7ngbmqpm&st=lbo6qgk7&dl=0 ;;
  5) wget -O- 'https://bit.ly/WIN10XZ' | xzcat | dd of=/dev/vdb ;;
  6) wget -O- 'https://bit.ly/4afmzIk' | xzcat | dd of=/dev/sda ;;
  *) echo "Wrong input!" ;;
esac 
