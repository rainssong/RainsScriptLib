@echo off
:: 当cookie文件创建之后的下一秒是下一分钟的话
:: 这段代码会出错，不过如此低的几率还是可以忍受:)
:: 测试有些网站的时候判断错误，比如http://www.eyou.com
:: 有些网站的cookie文件名并没有包含网站的关键字
if not exist e:\niuji md e:\niuji>nul 2>nul
if exist E:\niuji\1.txt del /q E:\niuji\1.txt
setlocal enabledelayedexpansion
set input=
set input=http://www.163.com
start %input%
for /f "delims=. tokens=1*" %%i in ("%input%") do set site=%%j
for /f "delims=. tokens=1*" %%i in ("%site%") do set net=%%i
set root="%userprofile%\cookies"
pushd %root%
set num=0
:loop
set /a num+=1
ping 127.1 -n 3 >nul 2>nul
if %num% gtr 4 echo FAILED>e:\niuji\1.txt && goto end
if not exist %username%@*%net%*.txt goto loop
for %%i in (%username%@*%net%*.txt) do (
    find /i "%site%" %%i>nul 2>nul && (
      if %time:~0,2% lss 10 (
        if "%date% 0%time:~1,4%"=="%%~ti" (echo SUCCESS>e:\niuji\1.txt) else (echo FAILED>e:\niuji\1.txt)
        goto end
      )
      if %time:~0,2% geq 10 (
        if "%date% %time:~0,5%"=="%%~ti" (echo SUCCESS>e:\niuji\1.txt) else (echo FAILED>e:\niuji\1.txt)
        goto end
      )
    )
)
:end
popd
start e:\niuji\1.txt