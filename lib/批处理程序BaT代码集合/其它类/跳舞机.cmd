@echo off
:: 模拟跳舞机显示变换的图案
:: Code by JM 2007-1-14 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=26672
mode con cols=40 lines=20
set str=↓↑←→↖↗↙↘▲▼◤◢◣◥

:begin
for /l %%i in (1,1,9) do set n%%i=  
set /a num=%random%%%14
call set char=%%str:~%num%,1%%
set /a num=%random%%%9+1
set n%num%=%char%
call :result
goto begin

:result
cls
echo.
echo.
echo.
echo.
echo.
echo           ┌──┬──┬──┐
echo           │ %n1% │ %n2% │ %n3% │
echo           ├──┼──┼──┤
echo           │ %n4% │ %n5% │ %n6% │
echo           ├──┼──┼──┤
echo           │ %n7% │ %n8% │ %n9% │
echo           └──┴──┴──┘
ping -n 2 127.1>nul
goto :eof