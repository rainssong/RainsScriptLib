:: 快速求出2的N次方
@echo off
:: Code by tao0610 2007-1-17 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=26825
set/p n=请输入2的几次方: 
set/a num=1^<^<n
echo %num%
pause
exit

@echo off
:: Code by lxmxn 2007-1-17 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=26825

:begin
cls
set num=&set result=
set /p num=计算2的n次方，请输入一个整数:
if %num%==0 (echo 1&pause&goto begin)
set /a num-=1
set /a result=2 "<<" %num%
echo %result%
pause
goto begin
exit/b0

@echo off
:: Code by everest79 2007-1-17 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=26825

set /p x=LEK:
set /p n=KEL:
IF NOT "%x%%n%" == "" (
IF /i "%x%" == "q" (
GOTO :EOF) ELSE (
SET /A NUM=x,VAR=x,n-=1)
) ELSE GOTO :EOF
for /l %%i IN (1,1,%n%) DO SET /A NUM*=%VAR%
echo %NUM%
pause>nul 