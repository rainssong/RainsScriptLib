@echo off
cd /d %~dp0
copy /Y %windir%\system32\drivers\etc\hosts %windir%\system32\drivers\etc\hosts.bak
copy /Y hostsWork %windir%\system32\drivers\etc\hosts
echo 已经切换到工作模式
pause