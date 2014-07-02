@echo off
:: 提取当前计算机所有用户
:: Code by JM CMD@XP
for /f "skip=4 tokens=1-3" %%i in ('net user') do (
    if not "%%i"=="命令成功完成。" if not "%%i"=="" echo %%i
    if not "%%j"=="" echo %%j
    if not "%%k"=="" echo %%k
)
pause