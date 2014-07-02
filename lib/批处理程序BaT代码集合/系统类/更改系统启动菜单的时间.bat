@echo off
set/p time=请输入您想要的启动时间
c:
type boot.ini>boot.bak
attrib -h -r -s boot.ini
type boot.bak|find "boot loader" /i>boot.ini
echo timeout=%time% >>boot.ini
type boot.bak|find "boot loader" /i /v|find "timeout" /i /v>>boot.ini
attrib +s +r +h boot.ini