@echo off
:: 计算开方
:: 效率不怎么样，并且只限于存在整数根的情况，超过2^31-1的数字就不行了
:: 没有对负数的开方进行处理
:: Code by JM 2007-3-15 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=28505

:Main
cls
set x=
set n=
set /p x=     请输入被开方的数：
set /p n=     请输入开方次数：
set /a mod=%n%%%2

if %x% equ 1 (
    echo.
    echo      %x% 的 %n% 次方根是 1
    echo.
    pause
    goto Main
)

set /a quotient=x/n
set flag=

for /l %%i in (2,1,%quotient%) do (
    set num=%%i
    for /l %%j in (2,1,%n%) do (
        set /a num=%%i*!num!
    )
    if !num! equ %x% (
        echo.
        if %mod% equ 0 (
            echo      %x% 的 %n% 次方根是 ±%%i
        ) else echo      %x% 的 %n% 次方根是 %%i
        echo.
        set flag=1
        goto end
    )
)

:end
if not defined flag (
    echo.
    echo      %x% 的 %n% 次方根不是整数
    echo.
)
pause
goto Main