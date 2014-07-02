@echo OFF
arp -d
if %~n0==arp exit
if %~n0==Arp exit
if %~n0==ARP exit
echo 正在获取本机信息.....
:IP
FOR /f "skip=13 tokens=15 usebackq " %%i in (`ipconfig /all`) do Set IP=%%i && GOTO MAC
:MAC
echo IP:%IP%
FOR /f "skip=13 tokens=12 usebackq " %%i in (`ipconfig /all`) do Set MAC=%%i && GOTO GateIP
:GateIP
echo MAC:%MAC%
arp -s %IP% %MAC%
echo 正在获取网关信息.....
FOR /f "skip=17 tokens=13 usebackq " %%i in (`ipconfig /all`) do Set GateIP=%%i && GOTO GateMac
:GateMac
echo GateIP:%GateIP%
ping %GateIP% -t -n 1
FOR /f "skip=3 tokens=2 usebackq " %%i in (`arp -a %GateIP%`) do Set GateMAC=%%i && GOTO Start
:Start
echo GateMAC:%GateMAC%
arp -s %GateIP% %GateMAC%
echo 操作完成!!! 
exit