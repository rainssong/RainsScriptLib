@echo off & setlocal EnableDelayedExpansion
:: 计算字符串的长度
:: code by willsort 2006-3-30  CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=19819
:began
set mystr=
set /p mystr=输入要计算长度的字符串(直接回车退出):
if not defined mystr goto :eof
for /l %%i in (0,1,1000) do if "!mystr:~%%i,1!"=="" set strlen=%%i && goto :_endfor
:_endfor
::echo 字符串:  "%mystr%"
echo 长  度:  %strlen%
set strlen=
goto began

该方案的缺陷是：当字符串长度超过1000的时候，将不能探测到；不过变量能接收的长度好象还不能超过1000

另外一种方案：

@echo off
:: Based on willsort's codes code by JM 2006-10-9 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=19819
set mystr=
set /p mystr=输入要计算长度的字符串(直接回车退出):
if not defined mystr goto :eof
set count=0
setlocal enabledelayedexpansion
:intercept
set /a count+=1
for /f %%i in ("%count%") do if not "!mystr:~%%i,1!"=="" goto intercept
echo 长  度:  %count%
pause
goto :eof

@echo off
:: code by 3742668 2006-3-29 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=19819
:began
set /p mystr=输入要计算长度的字符串:
echo %mystr:~0,1% | findstr /i "q" 1>nul 2>nul && exit  rem 输入q退出

call :bflen "%mystr%"       rem 这两句调用bflen，返回长度到变量ret中。
echo 字符串:        "%mystr%"
echo 长  度:        %ret%

goto began

:bflen        rem 真麻烦，初始化要单独拿出来。
set num=
set str=
set ret=
set str=%1
:len          rem 计算字符串长度
set str=%str:~0,-1%
set /a num = %num% + 1
if defined str goto len
set /a ret = %num% - 2
set num=
goto :eof