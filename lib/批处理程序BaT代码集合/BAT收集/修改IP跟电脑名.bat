@echo off
color a 
echo.
echo.
set /p name=请输您的计算机名：
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\ComputerName\ActiveComputerName" /v ComputerName /t reg_sz /d %name% /f
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters" /v "NV Hostname" /t reg_sz /d %name% /f 
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters" /v Hostname /t reg_sz /d %name% /f 
cls
echo 我们再进行设置IP吧。
@echo off
set slection1=
set/p slection1=请输入IP地址：
netsh interface ip set address name="本地连接" source=static addr=%slection1% mask=255.255.255.0
set slection2=
set/p slection2=请输入网关地址：
netsh interface ip set address name="本地连接" gateway=%slection2% gwmetric=0

set slection3=
set/p slection3=请输入主dns地址
netsh interface ip set dns name="本地连接" source=static addr=%slection3% register=PRIMARY

set slection4=
set/p slection4=请输入备份dns地址
netsh interface ip add dns name="本地连接" addr=%slection4%
netsh interface ip set wins name="本地连接" source=static addr=none
pause 