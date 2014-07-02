@echo off
:: 逐行逐字阅读文本
:: 不能处理特殊字符
:: 把半角双引号换成空格，把等号换成〓，兼容其他特殊字符
:: 能处理以分号打头的行
:: 能兼容unicode格式的文本
:: 每行之间空一行显示
:: Code by JM 2007-2-2 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=24889

:: 版本一：

for /f "delims= eol=" %%i in ('type %1') do (
    set "str=%%i"
    call set "str=%%str:"= %%"
    call :pickup
)
pause
goto :eof

:pickup
ping -n 1 127.1>nul
if "%str:~0,1%"=="=" set "str=〓%str:~1%"
set /p "=%str:~0,1%"<nul
set "str=%str:~1%"
if defined str goto pickup
echo.&echo.
goto :eof

:: 版本二：
@echo off
:: 与版本一的几点区别：
::　　 1、不能处理unicode文本
:: 　　2、每行之间不再强行加上空行，并且能原样显示空行
for /f "delims= eol=" %%i in ('findstr /n .* %1') do (
    set "str=%%i"
    call set "str=%%str:"= %%"
    call set "str=%%str:*:=%%"
    call :pickup
)
echo.
pause
goto :eof

:pickup
if not defined str echo.&goto :eof
if "%str:~0,1%"=="=" set "str=〓%str:~1%"
set /p "=%str:~0,1%"<nul
ping -n 1 127.1>nul
set "str=%str:~1%"
if defined str goto pickup
echo.
goto :eof

:: 版本三：
@echo off&setlocal ENABLEDELAYEDEXPANSION
:: 能正确识别unicode格式的文本
:: 不能处理特殊字符
:: 不能处理以分号打头的行
:: 会把文本中的感叹号抛弃
:: 实际上，SET A="%1"和goto end 的表示是错误的
:: Code by lxmxn 2006-11-19 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=24889
FOR /F "DELIMS=" %%A IN ('type %1') DO (CALL;:__;"%%A")
endlocal&PAUSE&goto :EOF

::显示字符子函数————————————-
:__
        SET A="%1"
        SET B=0
        if "%A%"=="" goto end
        :BEGIN
        IF NOT "!A:~%B%,1!"=="" (
                SET/P=!A:~%B%,1!<NUL
                PING 127.1 -N 1 >NUL
                SET/A B+=1
                GOTO BEGIN
        ) else (
        :end
        echo/&echo\
        )