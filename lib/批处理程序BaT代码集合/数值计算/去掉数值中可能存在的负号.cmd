:: 去掉某个数值可能存在的负号
:: 要求不能使用字符串替换语句及if语句
@echo off
:: Code by qzwqzw 2007-1-17 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=26802
set /p a=input
:: a取值的上下限各缩小一半
set /a b=(a*2+1)%%2*a 
ecoh %b%
:: 或者使用移位操作符号
:: set /a "b=(a^(a>>31))-(a>>31)"
pause
goto :eof

@echo off
:: Code by JM 2007-1-16 CMD@XP
set input=
set /p input=请输入实数：
for /f "tokens=* delims=-" %%i in ("%input%") do echo %%i
pause

