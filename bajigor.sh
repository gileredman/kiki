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
  1) wget -qO- inst.sh|bash -s - -t https://bit.ly/3VAINAe;;
  2) wget -qO- inst.sh|bash -s - -t https://bit.ly/WIN16GZ ;;
  3) wget -qO- inst.sh|bash -s - -t https://bit.ly/WIN19GZ ;;
  4) wget -qO- inst.sh|bash -s - -t https://bit.ly/WIN22GZ ;;
  5) wget -qO- inst.sh|bash -s - -t https://bit.ly/WIN10GZ ;;
  6) wget -qO- inst.sh|bash -s - -t https://bit.ly/WIN11GZ ;;
  *) echo "Wrong input!" ;;
esac 
