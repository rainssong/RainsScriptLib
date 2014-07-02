@echo off
set a=
set/p a=请输入要查找的用户名
net user %a% >nul 2>nul && echo 存在该用户 || echo 用户不存在.
pause>nul
