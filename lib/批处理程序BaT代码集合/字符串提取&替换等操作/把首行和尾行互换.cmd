@echo off
:: 目的：把首行和尾行互换
:: 思路：
::     提取第一行和最后一行内容(若首行和最后一行是空行，则提取到的是非空的第一行和非空的最后一行内容)，
:: 然后在新文本的首行写入提取到的最后一行，用 findstr 语句过滤掉原文本的第一行和最后一行，在最后一行
:: 之后添加提取到的第一行。
:: 因为 findstr 处理最后一行有条件限制，所以先在最后一行之后生成一个空行，以保证提取的准确性
:: 注意：请保证test.txt中没有敏感字符，没有内容重复的行，并且首行不能为空
:: code by jm 2006-11-5 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=24563
copy test.txt test.bak>nul
echo.>>test.txt
set num=0
setlocal enabledelayedexpansion
for /f "delims=" %%i in (test.txt) do (
    set str=%%i
    set /a num+=1
    if !num! equ 1 set var=%%i
)
>test_.txt echo.%str%
findstr /b /e /v /c:"%str%" /c:"%var%" test.txt>>test_.txt
>>test_.txt echo.%var%
move test.bak test.txt
start test_.txt
goto :eof

@echo off
:: 可以处理首行为空、行内容重复的情况，
:: 注意：因为 findstr /n 统计行数的时候，会忽略最后一个空行
:: 所以，若在最后有空行的话，请保证空行的个数大于1
findstr /n .* test.txt>tmp1.txt
for /f "tokens=1* delims=:" %%i in (tmp1.txt) do (
    if %%i equ 1 set str=%%j
    set line=%%i&set var=%%j
)
>tmp2.txt echo %line%:%var%
findstr /b /v /c:"1:" /c:"%line%:" tmp1.txt>>tmp2.txt
echo 1:%str%>>tmp2.txt
echo.>>tmp2.txt
cd.>result.txt
for /f "tokens=1* delims=:" %%i in (tmp2.txt) do >>result.txt echo.%%j
del /q tmp1.txt tmp2.txt
start result.txt