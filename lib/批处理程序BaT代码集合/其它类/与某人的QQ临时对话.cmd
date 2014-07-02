@Echo Off
:send
Set /p num=请输入对方的QQ号码:
If /I "%num%"=="n"  Exit
start tencent://Message/?Uin=%num%
cls
Goto send
