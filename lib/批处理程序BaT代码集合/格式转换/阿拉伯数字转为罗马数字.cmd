:: Arab2Roman 阿拉伯数字转为罗马数字
:: qzwqzw @ http://bbs.cn-dos.net
:: 2007-01-02 Revision 3
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=26230
@echo off
setlocal EnableDelayedExpansion

:test
if "%~0"=="%~f0" cls
setlocal
set /p num=请输入阿拉伯数字num（"0<num<4000"，直接回车退出）:
if "%num%"=="" goto :eof

:checknum
set /a tmp=num+0
if "%num%"=="%tmp%" if %num% lss 4000 if %num% gtr 0 goto Arab2Roman

:error
echo.
echo 无效的数字
echo.
if "%~0"=="%~f0" pause
endlocal
goto test

:Arab2Roman
set i=0
for %%v in (1000 900 500 400 100 90 50 40 10 9 5 4 1) do (
    set /a i+=1
    set arab!i!=%%v
)

set i=0
for %%v in (M CM D CD C XC L CL X IX V IV I) do (
    set /a i+=1
    set roman!i!=%%v
)

set i=1
:loop
call set tmp=%%arab%i%%%

if 1%num% lss 1%tmp% (
    set /a i+=1
) else (
    call set rom=%rom%%%roman%i%%%
    set /a num-=tmp
)
if 1%num% gtr 10 goto loop
::Arab2Roman

echo.
echo %rom%
echo.
if "%~0"=="%~f0" pause

endlocal
goto test