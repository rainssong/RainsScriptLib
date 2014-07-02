@echo off
:: 用10以内的数字做随机四则混合运算
:: 因为除法有不能除尽的情况，剔除除法
:: 随机插入括号对
:: 没有考虑溢出的情况
:: 缺点：有时候会把整个算术表达式用括号括起来
:: Code by JM 2007-1-16 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=26749

set str1=＋－×
setlocal enabledelayedexpansion

:begin
cls
set count=0
set item=0
set times=0
set expression=
set input1=
set input2=
set /p input1=     请指定参与运算的数字的个数(退出请直接按回车)：
set /p input2=     请输入算术表达式可能出现的最大条数(退出请直接按回车)：
if not defined input1 exit
if not defined input2 exit
cls

:loop
if %times% equ %input2% goto end
set expression=
set count=0
for /l %%i in (1,1,%input1%) do call :build
call :insert_sum
if %sum% lss 0 goto loop
set /a total+=%sum%&set /a item+=1
echo 第 %item% 条(%times%/%input2%): %expression:~1%=%sum%
goto loop

:end
set /a aver=%total%/%item%
set /a mod=%total%%%%item%
echo.
echo %item% 条记录的算术平均值是：%total%/%item%=%aver%……%mod%
echo.
echo          按任意键再来一次
pause>nul
goto begin


:build
:: 构造没有括号对的表达式
set /a num=%random%%%10
set /a SN=%random%%%3
set expression=!str1:~%SN%,1!%num%%expression%
goto :eof

:insert_sum
:: 随机插入括号对并计算每个表达式的结果
set /a length=2*%input1%
set /a num1=%random%%%%input1%
if %num1% equ 0 set num1=1
for /l %%i in (1,2,%length%) do (
    set /a count+=1
    if !count! equ %num1% set num1=%%i&goto next
)
:next
set count=0
set /a bg=%num1%+3
set /a remain=(%length%-%bg%)/2+1
if %remain% neq 1 (
    set /a num2=%random%%%%remain%+1
) else set num2=1
for /l %%i in (%bg%,2,%length%) do (
    set /a count+=1
    if !count! equ %num2% set num2=%%i&goto add
)
:add
set /a dif=%num2%-%num1%
set expression=!expression:~0,%num1%!(!expression:~%num1%,%dif%!)!expression:~%num2%!
set sum=%expression:＋=+%
set sum=%sum:－=-%
set sum=%sum:×=*%
set /a sum=%sum:~1%
set /a times+=1
goto :eof