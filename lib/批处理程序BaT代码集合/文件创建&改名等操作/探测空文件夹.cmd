@echo off
:: Code by JM 2006-7-21 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=21989
dir /a /b "目标文件夹"|findstr .>nul&& echo 有文件 || echo 没有文件
pause
goto :eof

@echo off
:: 探测空文件夹
:: Code by jm 2007-1-5 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=25398
set flag=
for /f %%i in ('dir /a /b "目标文件夹"') do set flag=1
if defined flag (echo 文件夹非空) else echo 这是个空文件夹
pause
goto :eof