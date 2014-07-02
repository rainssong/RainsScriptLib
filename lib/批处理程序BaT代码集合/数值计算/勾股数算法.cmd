@echo off
:: code by jm 2006-11-11 modified by youxi01
:: 可剔除数字位置不同而内容相同的记录
echo.
echo 100以内的勾股数如下：
echo.
setlocal enabledelayedexpansion
for /l %%i in (1,1,100) do (
    for /l %%j in (%%i,1,100) do (
        for /l %%k in (%%j,1,100) do (
            set /a a=%%i*%%i
            set /a b=%%j*%%j
            set /a c=%%k*%%k
            set /a sum=!a!+!b!
            if !sum! equ !c! echo %%i %%j %%k
        )
    )
)
pause