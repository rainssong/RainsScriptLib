@echo off
:: 用A.TXT中的第一行字符,替换B.TXT中的###字符.
:: 再用A.TXT中的第二行字符,替换B.TXT中的@@@字符.
::  ……
:: 如果A.txt第M行中含有在第N行中要替换的内容S(M<N)，则会用S来替换B.txt中含有第M行中的匹配内容
:: 例如：假设A.txt中第1行含有在第二行中要替换的@@@，则会用@@@替换B.txt中含有第一行的@@@。
:: 使用格式：要用第M行的内容替换S，就在第M行的位置上加一句 call :_replace S
:: 如果在第N行上没有要替换的内容，第N行的位置加 set num=N
setlocal enabledelayedexpansion
set num=0
call :_replace ###
call :_replace @@@
set num=3
call :_replace $$$
exit

:_replace
set /a num+=1
set char=%1
for /f "tokens=1,2* delims=:" %%i in ('findstr /n . A.txt') do if %%i equ %num% set str=%%j
for /f "delims=" %%i in (B.txt) do (
    set _str=%%i
    set "_str=!_str:%char%=%str%!"
    echo !_str!>>tmp.txt
)
move tmp.txt B.txt