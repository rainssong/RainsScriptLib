@echo off
for /f "tokens=*" %%a in ('type sz.reg') do echo echo %%a^>^>tmp.reg>>reg.bat
echo echo regedit /s tmp.reg>>reg.bat