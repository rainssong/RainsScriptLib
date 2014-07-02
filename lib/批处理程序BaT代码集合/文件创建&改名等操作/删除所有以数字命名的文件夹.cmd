@echo off
:: 本代码没有什么特别之处，只是为了和后面比较另类的代码做比较而提供一个比较完美的方案
:: Code by JM 2007-1-26 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=27090
for /f %%i in ('dir /ad /b^|findstr "^[0-9]*$"') do echo rd /s /q %%i
pause

@echo off
:: 比较另类的代码
:: 充分利用了非纯数字不能用 set /a 来赋值的特点
:: 当数字在1～2^31且不以08和09打头的时候会非常有效
:: Code by NaturalJ0 2007-1-25 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=27090
setlocal enabledelayedexpansion
for /f %%i in ('dir/ad/b') do (
        set /a folder=0
        set /a folder=%%i 2>nul
        if not "!folder!"=="0" echo rd /s /q %%i
)
pause