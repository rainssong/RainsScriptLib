@echo off
:: 处理比较大的数字的时候速度会比较慢，比如52317和75569
:: Code by JM 2007-1-23 CMD@XP 2007-1-24 modified
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=27054
setlocal enabledelayedexpansion

:begin
cls
set flag=
set num1=
set num2=
set /p num1= 请输入第一个数：
set /p num2= 请输入第二个数：
if %num1% leq %num2% (set min=%num1%) else set min=%num2%
:: 此 if 语句可以改为 if %num1% gtr %num2% set /a num1=%num2%,num2=%num1% ，
:: 以达到减少变量数目的目的，则下一句 for 中的 %min% 就得相应地修改为 %num1% 
for /l %%i in (%min%,-1,2) do (
    set GCD=%%i
    set /a mod1=%num1%%%%%i
    set /a mod2=%num2%%%%%i
    if !mod1! equ 0 if !mod2! equ 0 set flag=1&goto end
)

:end
if defined flag (
    set /a LCM=%num1%/%GCD%*%num2%
    echo %num1% 和 %num2% 的最大公约数是 %GCD%，最小公倍数是 !LCM!
) else (
    set /a LCM=%num1%*%num2%
    echo %num1% 和 %num2% 最大公约数为1，最小公倍数是 !LCM!
)
pause
goto begin


@echo off
:: 展转求余，速度非常快
:: Code by ccwan Modified by JM 2007-1-24 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=27054

set/p a=输入第一个数
set/p b=输入第二个数
:: 原帖代码：set/a ab=%a%*%b%
set /a num_a=a,num_b=b
cls&echo.&echo/&echo\
echo %a% 和 %b% 的   最大公约数        最小公倍数
if %a% lss %b% goto restart

:loop
set/a num2=%a%%%b%
if %num2% gtr 0 set/a a=%b%&set/a b=%num2%&goto loop
goto show

:restart
set/a num1=%a%
set/a a=%b%
set/a b=%num1%
goto :loop

:show
:: 原帖代码：set/a num=%ab%/%b%
set /a num=%num_a%/%b%*%num_b%
echo                     %b%                %num%
pause>nul
