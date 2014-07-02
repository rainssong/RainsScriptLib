@echo off
:: 代码编写：3742668 代码修订：namejm www.cn-dos.net

::调用格式：
call :select "ip address" "ip"
call :select "Physical Address" "mac"
call :select "Default Gateway" "gateway"
call :select "DNS Servers" "dns"
call :select "Description" "netcard"

:: 演示效果
echo.
echo.
echo             欢 迎 使 用 心 如 止 水 网 络 配 置 信 息 查 看 器  
color a
echo.
echo.
echo.
echo               本机IP:%ip%
echo               本机MAC:%mac%
echo               本机DNS:%dns%
echo               网关IP:%gateway%
echo               网卡名称:%netcard%
ipconfig /all >d:\ipconfig.txt
echo.
echo                 已经将此信息存在D:\ipconfig.txt
echo 000000000000000000000000000000000000000000000000000000000000000000000
pause>nul
goto :eof

::**************************************************************
::              解析ipconfig命令输出通用函数
::**************************************************************
:select
    for /f "tokens=2 delims=:" %%i in ('ipconfig /all ^| findstr /i /c:%1') do if not "!%~2!" == "" set "%~2=%%i"
goto :eof