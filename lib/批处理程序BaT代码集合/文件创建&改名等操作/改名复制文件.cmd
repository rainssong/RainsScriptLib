@echo off
:: 把f:\aa下的所有文本文件复制到e:\123下
:: 如果在e:\123下已经存在test.txt，则把
:: test.txt改名为test1.txt；如果已经存在
:: test1.txt，则把test.txt改名为test2.txt……
:: 如此反复……
::
:: Code by jm 2006-12-26 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=26061

set num=0
for /f "delims=" %%i in ('dir /a-d /b f:\aa\*.txt') do (
    if not exist "e:\123\%%i" (
        copy "f:\aa\%%i" e:\123>nul
    ) else call :copy_txt "f:\aa\%%i" "%%~ni" %%~xi
)
goto :eof

:copy_txt
set file_n=%2
set "file_n=%file_n:~1,-1%"
set file_x=%3
set /a num+=1
if not exist "e:\123\%file_n%%num%%file_x%" (
    copy %1 "e:\123\%file_n%%num%%file_x%">nul
) else call :copy_txt %1 "%file_n%" %file_x%
set num=0
goto :eof