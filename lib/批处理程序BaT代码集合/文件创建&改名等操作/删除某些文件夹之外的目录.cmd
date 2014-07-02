@echo off
:: 排除指定的文件夹，删除其余的目录
:: config.ini 里的文件夹格式为：,+要排除的文件夹名+,
:: code by jm 2006-12-19

for /f "delims=" %%i in ('dir /ad /b') do findstr /i /c:",%%i," config.ini>nul||echo "%%i"
pause
goto :eof

@echo off
:: echo之后再管道再find的方案比较慢
set dir_=,program files,Documents and Settings,
for /f "delims=" %%i in ('dir /ad /b') do (
    echo "%dir_%"|find /i ",%%i,">nul||echo "%%i"
)
pause