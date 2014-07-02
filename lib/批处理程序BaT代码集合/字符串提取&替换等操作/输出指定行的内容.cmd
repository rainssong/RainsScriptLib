@echo off
:: 如果1.txt中找到了222，就把此行之下的内容都输到2.txt中去
:: code by jm 2006-9-10 CMD@XP
set count=0
for /f "tokens=*" %%i in (1.txt) do (
    set /a count+=1
    echo %%i|findstr "222">nul && goto :ok
)
goto :eof

:ok
cd.>2.txt
for /f "skip=%count% tokens=*" %%i in (1.txt) do (>>2.txt echo %%i)