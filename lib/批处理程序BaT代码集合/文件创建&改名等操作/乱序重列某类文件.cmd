@echo off
:: 随机获取文件名
:: 没有考虑到特殊字符的问题
:: Code by 无奈何 2006-7-27 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=22128
@echo off
if "%1" NEQ "$" (
        for /f "tokens=1,2 delims=:" %%a in ('"%~0" $^|sort') do @echo %%b
) else for /f "delims=" %%i in ('dir /b /a-d') do @call :sub %%i
goto :EOF

:sub
echo %random%:%*
goto :EOF

@echo off & setlocal
:: Code by willsort 2006-7-8 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=22128
dir %1 /a/s/w/-c | findstr "个文件">temp.txt
for /f %%i in (temp.txt) do set filenum=%%i
echo.FileNum:%filenum%
if exist temp.txt del temp.txt
goto :eof

@echo off
:: Code by zh159 2006-12-10 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=22128
for /f "delims=" %%i in ('dir/a-d/b *.mp3') do call set $%%random%%$%%i=$
for /f "tokens=1,2* delims=$=" %%i in ('set $') do echo %%j
pause
goto :eof



@echo off
:: 随机获取文件名
:: 效率低下
:: dir 中加入/-c能将数字中的逗号去掉
:: 注意delims=后面有空格
::   code by jm CMD@XP 2006-7-27
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=22128

if exist list.txt del /q list.txt
if exist num.txt del /q num.txt
echo 已经列表的曲目编号：>num.txt
set _time=1
for /f "tokens=1 delims= " %%i in ('dir "要操作的文件夹\*.mp3"^|find "个文件"') do set max=%%i
:loop
set num=%random:~-3%
set /a num=1%num%-1000
if %num% leq 0 goto loop
if %num% gtr %max% goto loop
for /f %%i in (num.txt) do if %%i equ %num% goto loop
for /f "tokens=1,2* delims=:" %%i in ('dir /a-d /b "要操作的文件夹\*.mp3"^|findstr /n .') do (
  if %%i equ %num% (
    echo %%i>>num.txt & echo %%j>>list.txt && set /a _time+=1 && if %_time% lss %max% goto loop
  )
)
del /q num.txt
start list.txt
goto :eof

@echo off
:: Code by 3742668 2006-12-10 CMD@XP 要求文件名相似度不能太高
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=22128
    set /a num=%random% %% 4 + 1
    dir /b /a-d | sort /+%num%
pause
exit /b 0
