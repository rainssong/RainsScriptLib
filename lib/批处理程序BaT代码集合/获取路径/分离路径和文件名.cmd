:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=23919

@echo off
:: 获取某个路径格式字符串中指定节的字符串
:: code by jm 2006-12-11 CMD@XP
set "str=c:\t est\abc.txt\cd &h\yes ! h"
for /f "tokens=2* delims=\" %%i in ("%str%") do echo "%%i\%%j"
pause
goto :eof

@echo off
:: 获取当前目录名
:: 当路径中含有空格、感叹号、点号、&和~的时候，也能正确提取
set "cd_=%cd%"

:loop
set "cd_=%cd_:*\=%"
set "cd_tmp=%cd_:\=%"
if not "%cd_tmp%"=="%cd_%" goto loop
echo "%cd_%"
pause
goto :eof

@echo off
:: 获取某个路径格式字符串中指定节的字符串
:: 通过set把\替换成用引号括起来的空格，然后用for来提取
:: 通过for循环，用shift把指定层次的字符串赋给%1
:: 该方案已经能处理带空格的路径，最具通用性
:: code by 3742668 2006-10-20 CMX@XP
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
:: 获取指定层次的文件(夹)名
:: 最后的一个echo可以换成任何一个命令
:: 有可能会记录echo的当前状态
:: 难点在于去掉最后几个\分隔的内容
:: code by 3742668 2006-10-20 CMD@XP
setlocal ENABLEDELAYEDEXPANSION
set str=c:\ab c\def\gh .exe
set num=3
for /l %%i in (1,1,%num%) do set "str=!str:*\=!"
echo %str:\=&& 2>nul echo%
pause


@echo off
:: 获取某个路径格式字符串中指定节的字符串
:: 通过set把\替换成用引号括起来的空格，然后用for来提取
:: 该方案具备较大的通用性——除了不能处理带空格的路径
:: code by 3742668 2006-10-18 CMX@XP
set file=c:\abc\def\ghi.xyz
set file=%file:\=" "%
call :Get "%file%"
pause
goto :eof

:Get
for /f "tokens=3" %%i in (%*) do echo %%~i
goto :eof

@echo off
:: 获取最后一个\之后的字符串
:: 利用set来抛弃\之前的所有字符
:: 该方法最具通用性，扩展之后可以获取任意层次的文件夹名——代码比上一个要长一点
:: code by 3742668 2006-10-18
set file=c:\abc\def\hij.xyz
set str=%file%

:loop
set str=%str:*\=%
echo %str% | findstr /i "\\" >nul && goto loop
echo %file% ---^> %str%
pause

@echo off
:: 分离路径形式字符串中最后一个\前后的内容
:: 通过截取最后一个\之后的字符串来获得文件名
:: 该算法是最保险的，也是最烦琐的
:: code by jm 2006-10-5 CMD@XP
for /f "delims=" %%i in ("c:\te st\test.txt") do (
    set route=%%i
    set filename=
    call :separate
)
pause
goto :eof

:separate
if not "%route:~-1%"=="\" (
    set filename=%route:~-1%%filename%
    set route=%route:~0,-1%
    goto separate
    ) else (
    echo %filename% 所在目录的路径为 %route:~0,-1%
)
goto :eof


利用CMD解析文件名的一个漏洞来获取文件名
(该漏洞的内容是：只是简单地把最后一个\后的字符串当作文件，把最后一个点号当作文件名和扩展名的分隔符号)
@echo off
:: code by 3742668  2006-10-18
    set file=c:\abc\efg\c
    call :Print "%file%"
pause
goto :eof

:Print
    echo %~nx1
goto :eof

@echo off
:: 同样利用了该漏洞
:: code by jm 2006-10-18
set file=c:\abc\efg\xxx.xxx
for "delims=" %%i in ("%file%") do echo %%~nxi
pause
goto :eof
