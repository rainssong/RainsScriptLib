@echo off
:: 目的：交换两个变量的值，但是不使用临时变量
:: Code by JM 2007-1-24 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=27078

set var1=abc
set var2=123
echo 交换前： var1=%var1% var2=%var2%
set var1=%var2%& set var2=%var1%
:: & 换成 && 也可以
echo 交换后： var1=%var1% var2=%var2%
pause

:: 如果变量的值是数值，进行交换还有另外的方法：
:: 第一种方法：

set /a num1=123,num2=456
echo 交换前： num1=%num1% num2=%num2%
set /a num1=%num2%,num2=%num1%
:: set num1=%num2%& set num2=%num1% 也是可以的
echo 交换后： num1=%num1% num2=%num2%
pause

:: 第二种方法：
:: 会有数值范围的限制，即 num_a 与 num_b 的和必须在2^-31~2^31-1这个范围内
set /a num_a=123,num_b=456
echo 交换前： num_a=%num_a% num_b=%num_b%
set /a num_a=%num_a%+%num_b%-%num_a%,num_b=%num_a%+%num_b%-%num_b%
echo 交换后： num_a=%num_a% num_b=%num_b%
pause

:: 以上代码均利用了同一语句中的变量值在以后的语句中才会发生变化的特点(除了变量延迟的情况)

@echo off
:: 利用异或运算来操作
:: Code by pengfei 2007-1-24 CMD@XP
set a=2
set b=3
echo a=%a%  b=%b%
set /a "a=b^a"
set /a "b=b^a"
set /a "a=b^a"
echo a=%a%  b=%b%
:: 利用算术方法来改变
set /a a=a+b
set /a b=a-b
set /a a=a-b
echo a=%a%  b=%b%
pause