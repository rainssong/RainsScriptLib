@echo off
mode con: cols=64 lines=25
title ÒÝµçÊÓ[ETelevision]
color F0
:start
cls
image pic\start.bmp 0 0
pause>Nul
:menu1
set ym=1
cls
image pic\menu1.bmp 0 0
set/p cc=
if "%cc%"=="x" call :page y
if "%cc%"=="w" call :page z
if "%cc%"=="z" exit
call :play %cc%
:menu2
set ym=2
cls
image pic\menu2.bmp 0 0
set/p aa=
if "%aa%"=="x" call :page y
if "%aa%"=="w" call :page z
if "%aa%"=="z" exit
call :play %aa%
:play
set x=%1
image pic\tv.bmp 0 0
data\live %x%
image pic\tvover.bmp 0 0
ping/n 2 127.1>nul
goto menu%ym%
:page
image /d
if "%1"=="y" goto y
:z
if "%ym%"=="1" cls&image pic\first.bmp 0 0&ping/n 3 127.1>nul&goto menu1
if "%ym%"=="2" (
goto menu1
)
:y
if "%ym%"=="2" cls&image pic\last.bmp 0 0&ping/n 3 127.1>nul&goto menu2
if "%ym%"=="1" (
goto menu2
)