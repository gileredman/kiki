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
  1) wget -q https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh dd --img=https://www.dropbox.com/scl/fi/h80bvf4rks5w8c52fg3em/windows2012.gz?rlkey=a9us4b9loa5hsgwhgwvvggju3&st=r5kqtojx&dl=0 ;;
  2) wget -q https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh dd --img=https://www.dropbox.com/scl/fi/cdahxvahskpemh2fcnb6v/windows2016.gz?rlkey=ayso6omt9lvnl5l3fuj04lw2q&st=ekc0dubp&dl=0 ;;
  3) wget -q https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh dd --img=https://www.dropbox.com/scl/fi/d8zp5plh2sl82sib83xoz/windows2019.gz?rlkey=qne3mhje6xjp8b3mqb5bt4ufj&st=pzkj9azi&dl=0 ;;
  4) wget -q https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh dd --img=https://www.dropbox.com/scl/fi/aninq4b0qwyt0lao7rvff/windows2022.gz?rlkey=gg2nvn9zs9myqe2noqj57rflq&st=35teqn6r&dl=0 ;;
  5) wget -q https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh dd --img=https://www.dropbox.com/scl/fi/iza7jeticdxurp25mko6e/windows10.gz?rlkey=icww461d9m52d1ab0vbar2kc2&st=vk5divq5&dl=0 ;;
  6) wget -q https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh dd --img=https://www.dropbox.com/scl/fi/mqpdxch6obprx6mfmk6lb/windows11.gz?rlkey=66706g0fde2nhpjkhv0jpzyv5&st=x18swwmg&dl=0 ;;
  *) echo "Wrong input!" ;;
esac 
