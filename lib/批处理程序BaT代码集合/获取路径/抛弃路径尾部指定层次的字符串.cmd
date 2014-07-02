@echo off
:: 目的：
:: 　　抛弃路径尾部指定层次的字符串
:: 思路：
::     通过for语句扩展，截取文件所在的目录路径
::　　 当要抛弃的层数超过实际层数时，保留根目录层次
:: Code by JM 2006-1-18 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=26174
set "route=c:\a&bc\!dx\test dos\123.txt\"
set layers_discard=3
if "%route:~-1%"=="\" set "route=%route:~0,-1%"
for /l %%i in (1,1,%layers_discard%) do call :intercept "%%route%%"
:end
echo "%route%"
pause
goto :eof

:intercept
for /f "delims=" %%i in (%1) do set "route=%%~dpi"
if "%route:~-2,1%"==":" (goto end) else set "route=%route:~0,-1%"
goto :eof


@echo off
:: 目的：
:: 　　抛弃路径尾部指定层次的字符串
:: 思路：
:: 　　先反序读取路径字符串，然后从头开始截去指定层次
:: 　　最后再反序读取剩余字符串
::
:: Code by JM 2006-12-29 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=26174

set num=0
set layers_discard=2
set "route=c:\a&bc\!dx\test dos\123.txt"
call :antitone "%route%"
call :intercept "%str%"
call :antitone "%route%"
echo "%str%"
pause
goto :eof

:antitone
set str=
set "var=%~1"
:loop1
if not "%var:~0,1%"=="" set "str=%str%%var:~-1%"
set "var=%var:~0,-1%"
if not "%var%"=="" goto loop1
goto :eof

:intercept
set "route=%~1"
:loop2
set "route=%route:*\=%"
set /a num+=1
if %num% lss %layers_discard% goto loop2
goto :eof