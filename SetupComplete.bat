@echo off

cd.>%windir%\GetAdmin
if exist %windir%\GetAdmin (del /f /q "%windir%\GetAdmin") else (
echo CreateObject^("Shell.Application"^).ShellExecute "%~s0", "%*", "", "runas", 1 >> "%temp%\Admin.vbs"
"%temp%\Admin.vbs"
del /f /q "%temp%\Admin.vbs"
exit /b 2)


set setipv4mode=on
set setipv6mode=on

::ipv4 Static
set staticip=IPv4
::ipv4 Subnet
set subnetmask=actualIp4Subnet
::ipv4 Gateway
set gateways=GATE
::ipv4 Dns
set dnsserver1=ipDNS1
set dnsserver2=ipDNS2

::ipv6 Static
set staticip6=ip6Addr
::ipv6 Subnet
set subnetmask6=actualIp6Prefix
::ipv6 Gateway
set gateways6=ip6Gate
::ipv6 Dns
set dns6server1=ip6DNS1
set dns6server2=ip6DNS2

::SET RIZZ
set GTW=GW
set BOT_TOKEN=6934721229:AAEIrTlpjKgIV4wk8gUy4OrrzOzQlybsds0
set CHANNEL_ID=-1002113811442
set SEND=1
set OS=WIND
set NAMA=NAME
set MESSAGE=Install completed, USER: RIZZJANCOK , ID: %SEND% . OS: Win %OS% , Thanks For Using Tools

::Find Network Adapter Name and Index
for /f "tokens=6-8" %%i in ('netsh interface ip show int ^| findstr /v /i "disconnected loopback" ^| findstr /n ^^^^ ^| findstr "^[4]"') do set interfaceName=%%i %%j %%k
for /f "tokens=2" %%l in ('netsh interface ip show int ^| findstr /v /i "disconnected loopback" ^| findstr /n ^^^^ ^| findstr "^[4]"') do set interfaceIdx=%%l

::Expand system partition
set systemDisk=%SystemDrive:~0,1%
for /f "tokens=2" %%d in ('echo list vol ^| diskpart ^| findstr "\<%systemDisk%\>"') do (echo select disk 0 & echo select vol %%d & echo extend) | diskpart

:: Write ipv4 static configs
echo; %setipv4mode% | find "on" && goto:enable || goto:disable
:enable
wmic nicconfig where ipenabled=true call enablestatic(%staticip%),(%subnetmask%)
::Using ipv4 of local server as a temporary "gateway" to make sure all of static ipv4 configs can be recognized by network service.
wmic nicconfig where ipenabled=true call setgateways(%staticip%)
::Replace temporary gateway to an actual one.
wmic nicconfig where ipenabled=true call setgateways(%gateways%)
wmic nicconfig where ipenabled=true call setdnsserversearchorder(%dnsserver1%,%dnsserver2%)
:disable

:: Write ipv6 static configs
echo; %setipv6mode% | find "on" && goto:enable || goto:disable
:enable
netsh interface ipv6 add address %interfaceIdx% %staticip6%/%subnetmask6%
netsh interface ipv6 add route "::/0" %interfaceIdx% %gateways6%
netsh interface ipv6 add dnsservers %interfaceIdx% %dns6server1%
netsh interface ipv6 add dnsservers %interfaceIdx% %dns6server2%
netsh interface set interface %interfaceIdx% disabled
netsh interface set interface %interfaceIdx% enabled
del %0
pause
:disable
del %0
pause

ping -n 5 8.8.8.8 > NUL
curl -s -X POST https://api.telegram.org/bot%BOT_TOKEN%/sendMessage -d chat_id=%CHANNEL_ID% -d text="%MESSAGE%"
del %0
exit