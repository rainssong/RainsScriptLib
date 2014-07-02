@echo off
:: 显示翻滚字符
:: code by  chenall 2006-10-31
setlocal enabledelayedexpansion
set b=./-\ /-\ **
set 速度=1
set 退格=
:b
for /l %%i in (0,1,200) do call :a %%i
goto :b
:a
set/a a=%1%%10
set/a c=%a%%%4
if %a% EQU 0 set/p=.<nul
if %c% EQU 3 (set/p=^|<nul) else (set/p=!b:~%a%,1!<nul)
ping/n %速度% 127.1>nul
set/p=%退格%<nul
goto :eof