@echo off
:: 随机生成一个<=127的整数，用1,2,4,8,16,32,64几个数的和表示出来。 
::
:: 举两个例子： 
:: 如果随机数是1,那么我要的结果是1=1 
:: 如果随机数是78,那么我要的结果是78=2+4+8+64
::
:: Code by youxi01 2006-12-31
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=26224

setlocal enabledelayedexpansion
echo ================================
echo.
echo        计算一个数字的计算式
echo ================================
set /P EN=请输入一个数字：

set /a var=%EN%
for %%i in (64 32 16 8 4 2 1) do (
    if !var! GEQ %%i (
         set /a var=!var!-%%i
         set str=!str!%%i+))

echo %str:~0,-1%=%EN%

pause>nul
