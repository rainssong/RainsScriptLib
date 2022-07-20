@echo off
cls
color 0a
TITLE KillPort Power By xx

:main
ECHO. ********************************************************************
ECHO. * *
ECHO. * *  1.全部端口列表
ECHO. * *  2.查询端口信息
ECHO. * *  3.查询PID对应进程
ECHO. * *  4.解除端口占用
ECHO. * *
ECHO. ********************************************************************
	echo.
set /p X=输入数字选择功能:

if %X%==1 (
	goto findAllPort
)else if %x%==2 (
goto mPort
)else if %x%==3 (
goto findPid
)else if %x%==4 (
goto killPort
)

:findAllPort
cls
	echo.	
	netstat -aon
	echo.
	goto main
	
:mPort
cls
    set /p mport=请输入要查找的端口:
	echo.	
	echo   协议   本地地址          	外部地址        	状态           PID
	netstat -aon|findstr %mport%
	echo.
	goto main

:findPid
cls
    set /p mPid=请输入端口对应的PID号:
	tasklist|findstr %mPid%
	echo.
	goto main
	
:killPort
cls
set /p port=请输入端口号：
for /f "tokens=1-5" %%i in ('netstat -ano^|findstr ":%port%"') do (
    echo kill the process %%m who use the port %port%
    tasklist|findstr %%m
    echo.
    taskkill /f /pid %%m
)
	echo.
	goto main