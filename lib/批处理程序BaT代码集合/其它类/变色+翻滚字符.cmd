@echo off&setlocal enabledelayedexpansion&cls&title *-提示信息-*&color 0f
:: Code by bagpipe 2006-11-10
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=24652
mode con: cols=40 lines=6
for /l %%a in (1,1,120) do (
if %%a leq 56 set/p=*<nul
if %%a equ 57 set/p=友<nul&ping -n 1 127.1>nul
if %%a equ 59 set/p=情<nul&ping -n 1 127.1>nul
if %%a equ 61 set/p=提<nul&ping -n 1 127.1>nul
if %%a equ 63 set/p=示<nul&ping -n 1 127.1>nul
if %%a geq 65 set/p=*<nul
)
set "c=12345689abcde"
echo/
set b=/-\
set 退格=
:b
for /l %%i in (0,1,3) do (
call :a %%i
set /a d=%random%%%13+1
)
goto :b
:a
set/a a=%1%%4
if %a% EQU 3 (set/p=          ^| Welcome to CN-DOS<nul) else set/p=          !b:~%a%,1! Welcome to CN-DOS<nul
ping/n 1 127.1>nul
color 0!c:~%d%,1!
set/p=%退格%<nul
goto :eof