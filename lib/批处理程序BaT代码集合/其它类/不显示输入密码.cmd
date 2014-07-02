: by Herbert Kleebauer
:: 用途：输入密码时不在屏幕上显示出来
:: electronixtar 转发 2007-1-16
:: 来源：http://www.cn-dos.net/forum/viewthread.php?tid=26795
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
@echo off
echo hP1X500P[PZBBBfh#b##fXf-V@`$fPf]f3/f1/5++u5x>in.com
set  /p password=Enter password:<nul
for /f "tokens=*" %%i in ('in.com') do set password=%%i
pause
del in.com
echo.
echo The Password is:"%password:~0,-1%"
pause