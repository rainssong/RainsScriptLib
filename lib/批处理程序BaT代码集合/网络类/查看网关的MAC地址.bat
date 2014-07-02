@echo off
set /p getway="ÇëÊäÈëÍø¹ØIPµØÖ·:"%getway%
arp -a|find "%getway% "
pause