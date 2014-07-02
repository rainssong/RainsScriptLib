@echo off 
color a 
Title XP端口-进程查询 
setlocal enabledelayedexpansion 
echo ╔-                              -╗ 
echo   本机开放的端口及使用该端口的进程 
echo ╚-                              -╝ 
echo ------------------------------------ 
echo          端口号           进程名称       
ECHO TCP协议: 
::利用netstat命令找出使用TCP协议通信的端口，并将结果分割； 
::将第二个参数(IP加端口)传给%%i，第五个参数(PID号)传给%%j; 
for /F "usebackq skip=4 tokens=2,5" %%i in (`"netstat -ano -p TCP"`) do ( 
  call :Assoc %%i TCP %%j 
  echo           !TCP_Port!           !TCP_Proc_Name!  
) 

ECHO UDP协议: 
for /F "usebackq skip=4 tokens=2,4" %%i in (`"netstat -ano -p UDP"`) do (  
  call :Assoc %%i UDP %%j 
  echo           !UDP_Port!           !UDP_Proc_Name! 
) 
echo 按任意键退出 
pause>nul 

:Assoc 
::对%1(第一个参数）进行分割，将第二个参数传给%%e。在本程序中，%1即为上面的%%i(形式为：IP:端口号) 
for /F "tokens=2 delims=:" %%e in ("%1") do ( 
    set  %2_Port=%%e 
  ) 
:: 查询PID等于%3(第三个参数)的进程，并将结果传给变量?_Proc_Name,?代表UDP或者TCP； 
for /F "skip=2 usebackq delims=, tokens=1" %%a in (`"Tasklist /FI "PID eq %3" /FO CSV"`) do ( 
   ::%%~a表示去掉%%a外面的引号，因为上述命令的结果是用括号括起来的。  
   set %2_Proc_Name=%%~a 
  ) 