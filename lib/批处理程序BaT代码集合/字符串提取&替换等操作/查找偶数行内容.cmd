@echo off
:: 查找偶数行内容
:: code by hitme
set n=0
for /f "delims=" %%i in (test.txt) do set /a n+=1
for /l %%i in (1,2,%n%) do (
    findstr /n "." test.txt|findstr /r "^%%i:">>tmp.txt
)
for /f "tokens=1* delims=:" %%i in (tmp.txt) do echo %%j>>end.txt
del tmp.txt
start end.txt

goto :eof

另一种方案
:: 不产生临时文件，并且速度要快得多
:: findstr中如果用.*，则在空行的位置会显示"ECHO 处于关闭状态。"；
:: 如果用.，则不会打印空行
:: code by jm CMD@XP 2006-7-29
@echo off
cd.>result.txt
setlocal enabledelayedexpansion
for /f "tokens=1* delims=:" %%i in ('findstr /n "." test.txt') do (
    set num=%%i
    call :mod
    if !mod! equ 0 echo %%j>>result.txt
)
start result.txt
goto :eof

:mod
set /a mod=%num%%%2
goto :eof

把上一段代码稍加改造，就可以去掉文本中的空行
@echo off
cd.>tmp.txt
for /f "tokens=1* delims=:" %%i in ('findstr /n "." test.txt') do (echo %%j>>tmp.txt)
cd.>result.txt
:: 当文本中的空行是其他未知代码时(从网页中复制过来会出现这种情况)，
:: 会在空行处显示"ECHO 处于关闭状态。"，以下代码是删除这行内容
findstr /v "\<ECHO 处于关闭状态。\>" tmp.txt>>result.txt
del /q tmp.txt
start result.txt