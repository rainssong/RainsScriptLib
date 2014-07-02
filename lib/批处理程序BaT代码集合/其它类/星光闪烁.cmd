@echo off&setlocal enabledelayedexpansion&title *一个眺望摩天轮的人*
:: code by bagpipe  2006-11-22 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=24652
mode con cols=30 lines=7
set a=☆☆☆☆☆☆☆☆☆☆
set b=★
set c=
set d=
set e=123456789abcde
echo/
echo **********(D--O--S)***********
echo  *Welcome to China Dos Union*
echo\
:b
for /l %%a in (0,1,9) do (
set /a f=%random%%%14+1
set/p=!a:~%%a,1!<nul&set/p=%b%<nul
ping -n 1 127.1>nul
color 0!e:~%f%,1!
set/p=%c%<nul
if %%a equ 9 (set/p=%d%<nul&for /l %%a in (9,-1,1) do (set/p=!a:~-%%a!!<nul&set/p=%b%<nul&ping -n 1 127.1>nul&set/p=%d%<nul))
)
goto b
