@echo off
:: 通过inf来重启电脑，号称适用于所有的windows
:: Author: joyadam@myrealbox.com
::  Date: 2002-1-13 18:34:39
:: modefy by jm 2006-9-10
echo welcome to http://www.sometips.com
cd/d "%temp%"
(echo [version]
echo signature=$chicago$
echo [defaultinstall])>reboot.inf
set inf=InstallHinfSection DefaultInstall
rundll32 setupapi,"%inf%" 1 "%temp%\reboot.inf"
del reboot.inf