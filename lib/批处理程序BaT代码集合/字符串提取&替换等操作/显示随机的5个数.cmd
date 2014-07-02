@echo off
:: 求1-100范围内随机的不同5个数值
:: 生成0-99之间的随机数列 R1
:: qzwqzw@bbs.cn-dos.net
:: 2007-01-04 23:03
::  出处：http://www.cn-dos.net/forum/viewthread.php?tid=26330
@echo off
setlocal EnableDelayedExpansion

:: 初始化顺序数列
for /l %%i in (0,1,99) do (
    set rnum%%i=%%i
)

:: 对数列进行随机交换
for /l %%i in (0,1,99) do (
    set /a rnd=!random! %% 100
    call set tmp=%%rnum!rnd!%%
    set rnum!rnd!=!rnum%%i!
    set rnum%%i=!tmp!
)

set rnum
pause
goto :eof


@echo off
:: Code by JM 2006-1-5 CMD@XP
:begin
cls
set times=0
set count=0

:loop
set /a num=%random%%%99+1
if not defined num%num% (
    set num%num%=%num%
    set /a count+=1
    call echo %%num%%
)
set /a times+=1
if %times% equ 20 (
    for /l %%i in (1,1,99) do set num%%i=
    set times=0
)
if %count% lss 5 goto loop
pause>nul
goto begin

@echo off
:: Code by JM 2007-1-6 CMD@XP
:: 因为用到了 echo|find 的结构，速度比较慢
::  出处：http://www.cn-dos.net/forum/viewthread.php?tid=26330
:begin
cls
set count=0

:loop
set /a num=%random%%%100+1
echo %str%|find " %num% ">nul&&goto loop
call set str=%%str%% %num% 
set /a count+=1
if %count% lss 5 goto loop
echo %str%
set str=
pause
goto begin



@echo off&setlocal enabledelayedexpansion
:: Code by 9527 2007-1-6 CMD@XP
::  出处：http://www.cn-dos.net/forum/viewthread.php?tid=26330
for /l %%a in (1;1;5) do (
set/a b=!random!%%99+1
call :pp !b!
)
goto :eof
:pp
if not defined %1 (set %1=a) else goto loop
echo %1
goto :eof
:loop
set/a b=!random!%%99+1
call :pp !b!


@echo off
:: Code by zh159 2007-1-6 CMD@XP
::  出处：http://www.cn-dos.net/forum/viewthread.php?tid=26330
set Max=100
set N=5

:start
cls
echo %time%
set Num=
set Tmp$=

:loop
set /a randomloop=(%random%+%random%+%random%)/3%%%Max%+1
for %%n in (%Tmp$%) do if "%randomloop%" == "%%n" goto loop
call set Tmp$=%%Tmp$%% %randomloop%
set /a Num+=1
set random_%Num%=%randomloop%
if %Num% LSS %N% goto loop

echo %Tmp$%
echo %time%
pause
goto start
exit


@echo off
:: Code by zh159 2007-1-4 CMD@XP
::  出处：http://www.cn-dos.net/forum/viewthread.php?tid=26330
:start
cls
set Num=
set Tmp$=

:loop
set /a randomloop=%random%%%99+1
for %%n in (%Tmp$%) do if "%randomloop%" == "%%n" goto loop
call set Tmp$=%%Tmp$%% %randomloop%
set /a Num+=1
set random_%Num%=%randomloop%
if %Num% LSS 5 goto loop

for /l %%n in (1,1,%Num%) do call set /p= %%random_%%n%%<nul
echo.
pause
goto start
exit
