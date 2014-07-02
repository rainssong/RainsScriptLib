@echo off
:: 10进制转换为16进制
:: code by 3742668 2006-6-28 CMD@XP
set /p 源数=输入十进制数字:
set /a 源数=%源数% || goto :eof

:dosomething
    set /a 余数 = %源数% %% 16
    set /a 源数 /= 16
    call :转换 %余数% 
    set 余数=%ret%
    set 计算结果=%余数%%计算结果%
    if %源数% lss 16 goto end
goto dosomething

:转换
    set ret=
    if "%1" == "10" set ret=A
    if "%1" == "11" set ret=B
    if "%1" == "12" set ret=C
    if "%1" == "13" set ret=D
    if "%1" == "14" set ret=E
    if "%1" == "15" set ret=F
    if %1 lss 10 set ret=%1
goto :eof

:end
call :转换 %源数%
set 源数=%ret%
if "%源数%" == "0" set 源数=
echo  0x%源数%%计算结果% 
set ret=
set 源数=
set 余数=
set 计算结果=
pause>nul
goto :eof

@echo off
:: Code by 0401 2007-1-6 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=26399
setlocal enabledelayedexpansion
set hexstr=0 1 2 3 4 5 6 7 8 9 A B C D E F
set d=0
for %%i in (%hexstr%) do (set d!d!=%%i&set/a d+=1)
set/p scanf=能正确处理的最大数为[2147483647]，请输入需要转换的十进制数：
if not defined scanf exit/b
set dec=%scanf%
call :d2h
if not defined hex set hex=0
echo %dec% 的十六进制为：0x%hex%
pause>nul
exit/b

:d2h
if %scanf% equ 0 exit/b
set/a tscanf=%scanf%"&"15
set/a scanf">>="4
set hex=!d%tscanf%!!hex!
goto :d2h