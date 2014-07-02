@echo off 
setlocal 
cd/d %temp% 
echo Set colOperatingSystems = GetObject("winmgmts:{(Shutdown)}").ExecQuery("Select * from Win32_OperatingSystem") >shutdown.vbs
echo For Each objOperatingSystem in colOperatingSystems >>shutdown.vbs
echo ObjOperatingSystem.Win32Shutdown(12) >>shutdown.vbs
echo Next >>shutdown.vbs
cscript shutdown.vbs
del shutdown.vbs
::;Value Meaning 
::;0 Log Off 
::;0 + 4 Forced Log Off 
::;1 Shutdown 
::;1 + 4 Forced Shutdown 
::;2 Reboot 
::;2 + 4 Forced Reboot 
::;8 Power Off 
::8 + 4 Forced Power Off 
pause
