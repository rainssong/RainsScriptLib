@echo off
:: 每6行拼接为一行，剩余的不够6行的显示在最后一行
:: code by jm thanks to 3742668    2006-9-21 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=23312
set num=0
setlocal enabledelayedexpansion
for /f "delims=" %%i in (a.txt) do (
    set /a num+=1
    set str=!str! %%i
    if !num! equ 6 echo !str! && set num=0 & set str=
)
if not "%str%"=="" echo %str%
pause