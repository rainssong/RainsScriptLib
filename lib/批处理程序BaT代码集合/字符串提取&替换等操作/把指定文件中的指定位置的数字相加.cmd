@echo off
:: 把某个目录下所有txt中第三行第四个数字相加
:: code by jm 2006-9-9 CMD@XP
set num=0
setlocal enabledelayedexpansion
:: 其实用skip=2来跳过头两行的效率更高
for %%i in (*.txt) do (
    set file=%%i
    for /f "tokens=1* delims=:" %%j in ('findstr /n . !file!') do (
        set var=%%k
        if %%j equ 3 (set num_=!var:~4,1!)&& set /a num=!num!+!num_!
    )
)
echo   相加后的结果是 %num%
pause
goto :eof

@echo off
:: 把某个目录下所有txt文件中第十行第三列的数字相加
:: code by jm 2006-9-9 CMD@XP
setlocal enabledelayedexpansion
for %%i in (*.txt) do (
    set file=%%i
    set count=0
    for /f "skip=9 tokens=3" %%j in (!file!) do (
       set /a count+=1
       if !count! equ 1 set /a sum+=%%j
    )
)
echo   相加后的结果是 %sum%
pause