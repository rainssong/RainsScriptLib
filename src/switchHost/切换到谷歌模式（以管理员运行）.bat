@echo off
cd /d %~dp0
copy /Y %windir%\system32\drivers\etc\hosts %windir%\system32\drivers\etc\hosts.bak
copy /Y hostsGoogle %windir%\system32\drivers\etc\hosts
@echo 已经切换到谷歌模式
pause