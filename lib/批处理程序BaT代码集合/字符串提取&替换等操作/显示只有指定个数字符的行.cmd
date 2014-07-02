@echo off
goto begin

参数1:文本文件名
参数2:要显示的行的字符数(可省)
例如要打印a.txt中的字符数为4的行:
print.bat a.txt 4
或者直接把要处理的文件拖放到脚本文件上，然后按提示操作。
效率非常高
code by 3742668   2006-8-14

:begin
setlocal ENABLEDELAYEDEXPANSION
set var=%2
if "%var%" == "" set /p var=输入要显示的行的字符数:
for /l %%i in (1,1,%var%) do set str=!str!.
findstr /x %str% %1
pause>nul
goto :eof

@echo off
:: 显示只有4个字符的文本行
:: test.txt中只有纯字母，无空格，无空行
:: 因为是全文解析，所以效率低下
:: code by jm 2006-8-14
for /f %%i in (test.txt) do (
    set str=%%i
    set var=%%i
    call :loop
    set num=0
)
pause
goto :eof

:loop
set var=%var:~0,-1%&& set /a num+=1
if not "%var%"=="" goto loop
if %num% equ 4 echo %str%
goto :eof

@echo off
:: 通过首尾插入字符来判断，效率较高
:: 适合行中带空格的情况
:: 如果不插入字符，只判断第5位的字符情况，会出错
:: code by 3742668
setlocal ENABLEDELAYEDEXPANSION
for /f "delims=" %%i in (test.txt) do (
    set str=b%%ie
    if not "!str:~5,1!" == "" if "!str:~6,1!" == "" echo. %%i
)
pause
goto :eof