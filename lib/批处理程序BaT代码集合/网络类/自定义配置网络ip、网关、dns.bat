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