::最小化运行批处理
@echo off&&mode con cols=15 lines=1
:: Code by everest79 2007-1-17 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=25095
%1 %2
start /min /i "" "%~nx0" goto min&&goto :eof

:min
echo xxx
pause>nul
exit

@echo off
:: Code by zh159 2006-11-25 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=25095
mode con cols=15 lines=1
if exist "Temp.bat" goto Start
>Temp.bat echo start/min "" "%~nx0"^&exit
start/min Temp.bat&exit

:Start
del "Temp.bat">nul
pause
