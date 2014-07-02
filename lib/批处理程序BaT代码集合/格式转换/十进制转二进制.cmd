@echo off
:: 十进制转二进制
:: Code by 0401 2007-1-6 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=26399
setlocal enabledelayedexpansion
set/p scanf=能正确处理的最大数为[2147483647]，请输入需要转换的十进制数：
if not defined scanf exit/b
set dec=%scanf%
call :d2b
echo %dec% 的二进制为：%bin%
pause>nul
exit/b

:d2b
set a=1
for /l %%i in (1,1,31) do (
        set/a t=%scanf%"&"!a!
        set/a a*=2
        if !t! equ 0 (set bin=0!bin!) else (set bin=1!bin!)
)
if %bin% equ 0 set bin=0 & goto :eof
:cut0
if %bin:~0,1% equ 0 set bin=%bin:~1%&goto :cut0