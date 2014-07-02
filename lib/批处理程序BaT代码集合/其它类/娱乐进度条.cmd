@echo off&setlocal enabledelayedexpansion
set a=▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉ 
set b=
color fc
mode con cols=52 lines=11
echo/&echo\
set/p=       ┏━━┓我      ●╭○╮   我┏━━┓<nul&echo.
set/p=       ┃天长┃愛  ☆ /█∨█\ ★ 想┃永远┃<nul&echo.
set/p=       ┃地久┃你      ∏  ∏     你┃拥有┃<nul&echo.
set/p=       ┗━━┛     我爱你一万年    ┗━━┛<nul&echo.
set/p=        进度条......<nul&echo.
set/p=<nul&echo.
for /l %%a in (1,1,19) do (
set /a d=%%a*2+6
call :pp %%a
)
pause>nul
:pp
set/p=      !a:~0,%1!<nul&set/p=!b:~0,%d%!<nul
ping -n 1 127.1>nul
goto :eof
