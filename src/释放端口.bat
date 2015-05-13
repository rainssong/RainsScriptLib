@echo off
if "%1" == "" goto info
setlocal enabledelayedexpansion
tasklist /fi "pid eq %1" | find "%1" > nul && (
  tasklist /fi "pid eq %1"
  echo.
  set /p str="是否要结束 PID 为 %1 的进程(Y/N)? "
  if /I "!str!" == "Y" taskkill /f /pid %1
) || echo 没有找到 PID 为 %1 的进程
goto end
:info
echo 使用方法：kill ^<需要结束的进程号(PID)^>
:end
echo on
