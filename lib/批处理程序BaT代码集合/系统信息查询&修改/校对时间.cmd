@echo off
:: 校对时间，在不禁用time服务的情况下有效
:: Code by 不得不爱 2006-10-27 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=24252
net stop w32time>nul 2>nul
net time /SETSNTP:time.windows.com>nul 
net start w32time>nul 