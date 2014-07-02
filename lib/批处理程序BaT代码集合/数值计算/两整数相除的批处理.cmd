@echo off
:: 只针对整数除法
:: 可以指定运算的精确度，没有做出错检测
:: Code by JM 2007-1-6 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=27477
setlocal enabledelayedexpansion

:begin
cls
set num=0
set dec_str=
set input=
set /p input= 请输入以空格分隔的被除数、除数和精确度：
for /f "delims=" %%i in ("%input%") do call :count %%i

:count
set /a int_str=%1/%2
set /a mod=%1%%%2
if %mod% equ 0 goto end

:count_dec
set mod=%mod%0
if %mod% lss %2 (
    set dec_str=!dec_str!0
    goto count_dec
) else (
    set /a dec=%mod%/%2
    set dec_str=!dec_str!!dec!
    set /a mod=%mod%%%%2
)
set /a num+=1
if %mod% neq 0 if %num% lss %3 goto count_dec

:end
for /l %%i in (1,1,%3) do set zero_str=!zero_str!0
set dec_str=%dec_str%%zero_str%
cls
echo.&echo.&echo.
echo                   %1÷%2=%int_str%.!dec_str:~0,%3! ^(保留 %3 位小数^)
echo.
pause
goto begin