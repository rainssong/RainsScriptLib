@echo off
set /P C=[Choice]: 
if "%C" == "" goto info
setlocal enabledelayedexpansion
tasklist /fi "pid eq %C" | find "%C" > nul && (
  tasklist /fi "pid eq %C"
  echo.
  set /p str="是否要结束 PID 为 %1 的进程(Y/N)? "
  if /I "!str!" == "Y" taskkill /f /pid %C
) || echo 没有找到 PID 为 %C 的进程
goto end
:info
echo 使用方法：kill ^<需要结束的进程号(PID)^>
:end
echo on
