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
  1) wget -q https://raw.githubusercontent.com/gileredman/kiki/main/bangor.sh && bash bangor.sh dd --img=https://www.dropbox.com/scl/fi/v1tjgtma9uzvqac2o958b/windows2012.gz?rlkey=ix61un5ecqlexy93d50vmw1t3&st=6dx3pgwn&dl=0 ;;
  2) wget -q https://raw.githubusercontent.com/gileredman/kiki/main/bangor.sh && bash bangor.sh dd --img=https://www.dropbox.com/scl/fi/faclvht7wzsc6dk21kogf/windows2016.gz?rlkey=gikoin3l4s5ksna50j6w5gknd&st=7jpjgwq6&dl=0 ;;
  3) wget -q https://raw.githubusercontent.com/gileredman/kiki/main/bangor.sh && bash bangor.sh dd --img=https://www.dropbox.com/scl/fi/jtx0yonyt2wv333f5zwtd/windows2019.gz?rlkey=kkmgadopud8dqdv5cwra0eis6&st=virxlt1h&dl=0 ;;
  4) wget -q https://raw.githubusercontent.com/gileredman/kiki/main/bangor.sh && bash bangor.sh dd --img=https://www.dropbox.com/scl/fi/37zlcd08ccyplppu1d6v4/windows2022.gz?rlkey=gykmr6dudursvklpxdsz4if26&st=87xxhf7c&dl=0 ;;
  5) wget -q https://raw.githubusercontent.com/gileredman/kiki/main/bangor.sh && bash bangor.sh dd --img=https://www.dropbox.com/scl/fi/pifgb3n74s26act0k449s/windows10.gz?rlkey=0vd8db2xa4yfsd0ubzsplo0bn&st=tvn590mw&dl=0 ;;
  6) wget -q https://raw.githubusercontent.com/gileredman/kiki/main/bangor.sh && bash bangor.sh dd --img=https://www.dropbox.com/scl/fi/5ntnmctersyjh2niajryl/windows11.gz?rlkey=zbfho4w49vovt8056g6uunuaa&st=aw6ews7g&dl=0 ;;
  *) echo "Wrong input!" ;;
esac 
