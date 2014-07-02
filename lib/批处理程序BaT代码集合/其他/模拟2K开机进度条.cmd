@echo off
setlocal enabledelayedexpansion
set /a b=81
set a=">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>================================================================================"


:back
cls
for /l %%i in (1,1,20) do @echo.
echo                        Loading Windows 2000...         
set /a b-=1
echo !a:~%b%,80!
if !b! == 1 goto :eof
call :delay 80
goto back


:delay   
set /a num=num + 1
if %num% geq %1 (set num=) && goto :eof
goto delay
