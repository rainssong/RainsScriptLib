@echo off
cd.>script.txt
>>script.txt echo list disk
for /f %%i in ('diskpart /s script.txt^|find /c ^"联机^"') do Set HardDrivers=%%i
del script.txt /q
echo 您的计算机上硬盘安装数量为：%HardDrivers%
pause