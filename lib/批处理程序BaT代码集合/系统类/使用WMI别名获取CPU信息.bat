::使用WMI别名获取PC主要信息.bat
::使用WMI别名获取主要信息,输出为网页格式
::--------by MOBO[墨伯] at 2006-09-16:
wmic baseboard list brief /format:hform >MyPC.htm
wmic cpu list full /format:hform >>MyPC.htm
wmic bios list brief /format:hform >>MyPC.htm
MyPC.htm