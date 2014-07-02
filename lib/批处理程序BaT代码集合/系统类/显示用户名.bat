@echo off
echo 所有用户帐号ID为：
echo.
for /f "skip=4 tokens=1-3" %%i in ('net user') do (
    if not "%%i"=="命令成功完成。" echo %%i
    if not "%%j"=="" echo %%j
    if not "%%k"=="" echo %%k
)
echo.
echo 当前用户帐号ID为：%username%
pause>nul