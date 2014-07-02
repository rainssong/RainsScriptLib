@echo off
:: code by 3742668 2006-9-23 CMD@XP
setlocal ENABLEDELAYEDEXPANSION
:start
    call :getinfo
    :loop
        ping 127.1 -n 1 2>nul 1>nul
        if "%diskfree%" == "" goto loop
    call :write
    start info.html
goto :eof

::**************************************************************
::                         采集信息
::**************************************************************
:getinfo
    echo 正在采集信息，请稍候...
    call :select "ip address" "ip"
    call :select "Physical Address" "mac"
    call :select "Default Gateway" "gateway"
    call :select "DNS Servers" "dns"
    call :select "Description" "netcard"
    for /f "delims=" %%i in ('ver') do set "osver=%%i"
    for /f "delims=" %%i in ('wmic logicaldisk where "Description='本地固定磁盘'" get caption^,freespace ^| findstr /v /i "caption"') do set "diskfree=!diskfree!%%ikb^^<br^^>"
goto :eof


::**************************************************************
::              解析ipconfig命令输出通用函数
::**************************************************************
:select
    for /f "tokens=2 delims=:" %%i in ('ipconfig /all ^| findstr /i /c:%1') do if "!%~2!" == "" set "%~2=%%i"
goto :eof

::**************************************************************
::                     生成网页格式文件
::**************************************************************
:write
>info.html echo ^<html^>^<center^>^<font size=10^>计算机信息^</font^>
>>info.html echo ^<p^>今天是%date%^<p^>
>>info.html echo ^<table width="40%%" border=1 bgcolor="darkcyan"^>
>>info.html echo ^<tr^>^<td width="25%%"^>用户名:^</td^>^<td^>%username%^</td^>^</tr^>
>>info.html echo ^<tr^>^<td width="25%%"^>计算机名:^</td^>^<td^>%userdomain%^</td^>^</tr^>
>>info.html echo ^<tr^>^<td width="25%%"^>IP地址:^</td^>^<td^>%ip%^</td^>^</tr^>
>>info.html echo ^<tr^>^<td width="25%%"^>MAC地址:^</td^>^<td^>%mac%^</td^>^</tr^>
>>info.html echo ^<tr^>^<td width="25%%"^>网关地址:^</td^>^<td^>%gateway%^</td^>^</tr^>
>>info.html echo ^<tr^>^<td width="25%%"^>DNS:^</td^>^<td^>%dns%^</td^>^</tr^>
>>info.html echo ^<tr^>^<td width="25%%"^>硬盘^<br^>剩余^<br^>空间^</td^>^<td^>%diskfree%^</td^>^</tr^>
>>info.html echo ^</table^>^<table width="40%%" border=1 bgcolor="darkcyan"^>
>>info.html echo ^<tr^>^<td^>^<font size=5^>您的操作系统版本号为:^</font^>^</td^>^</tr^>
>>info.html echo ^<tr^>^<td^>^<font size=4^>%osver%^</font^>^</td^>^</tr^>
>>info.html echo ^<tr^>^<td^>^<font size=5^>网卡型号:^</font^>^</td^>^</tr^>
>>info.html echo ^<tr^>^<td^>^<font size=4^>%netcard%^</font^>^</td^>^</tr^>
>>info.html echo ^</table^>^</center^>^</html^>
goto :eof