@echo off
:: 获取指定层次的目录名
:: Code by 3742668 2006-10-20
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=23919
    set file=c:\ab c\def\gh .exe
    set file=%file:\=" "%
    call :Get 4 "%file%"
pause
goto :eof

:Get
    for /l %%i in (1,1,%1) do shift
    echo %~1
goto :eof

@echo off
:: 获取指定层次的目录名
:: 把最后的cd换成echo就可以逐级显示．
:: echo %str:\= && 2>nul cd % 一句中，把cd换成任意的命令都能正确执行。
:: 这个语句的原型是：
:: set "command=set i=3"
:: echo i的值:%i% & pause
:: %command%
:: echo i的值:%i% & pause

:: 另外，echo %str:\= && 2>nul cd %在提取其中的文件夹名的时候，最后一位是空格，
:: 在提取文件名的时候没有这个问题，换成 echo %str:\=&& 2>nul cd % 就可以了(注意：两条语句&&前一个有空格，一个没有空格)。 
:: 获得最后的文件名时可能显示出一行＂ECHO 处于打开状态＂之类的提示
:: Code by 3742668 2006-10-20
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=23919
setlocal ENABLEDELAYEDEXPANSION
    set str=c:\ab c\def\gh .exe\
    set num=1
    for /l %%i in (1,1,%num%) do set "str=!str:*\=!"
    echo %str:\= && 2>nul cd %
pause
