@echo off
:: 去掉字符串头所有的0
:: code by 3742668 CMD@XP
    for /f "delims=0 tokens=*" %%i in ("0009029") do echo %%i
    pause>nul
goto :eof

@echo off
:: code by jm 2006-10-20 CMD@XP
set var=0002304500
:intercept
set var=%var:*0=%
if "%var:~0,1%"=="0" goto intercept
echo %var%
pause


@echo off
:: 去掉字符串头所有的0
:: code by 无奈何 2006-10-2 CMD@XP
set x=00010280
call :sub %x%
echo %y%
pause
goto :EOF
:sub
set y=%1
if "%y:~0,1%"=="0" call :sub %y:~1%
goto :EOF

@echo off
:: 去掉字符串头所有的0
:: set count=-1必须用-1而不能用0
:: code by JM 2006-10-10
set num=0003
set count=-1
setlocal enabledelayedexpansion
:loop
set /a count+=1
if "!num:~%count%,1!"=="0" goto loop
echo !num:~%count%!
pause