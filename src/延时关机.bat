@echo off
setlocal enabledelayedexpansion
echo 几分钟之后关机？（输入0则取消关机）
set /p s=输入分钟数：
if %s%==0 goto CancelF
set /a m=%s%*60
shutdown -s -t %m%
goto end
:CancelF
shutdown -a
:end
pause
