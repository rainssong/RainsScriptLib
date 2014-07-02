@echo off
netsh -c interface dump >网络信息.txt
:loop
cls
set a=
set/p a=1……查看网络信息，2……重新设置，Q……退出
if "%a%"=="1" start 网络信息.txt
if "%a%"=="2" netsh -f c:\gongsi.txt
if "%a%"=="q" exit
goto loop
