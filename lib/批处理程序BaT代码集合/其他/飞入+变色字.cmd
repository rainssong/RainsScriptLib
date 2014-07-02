@echo off&setlocal enabledelayedexpansion&cls&color 0f&title Welcome to CN-DOS!
:: code by bagpipe 2006-11-10 CMD@XP
:: ³ö´¦£ºhttp://www.cn-dos.net/forum/viewthread.php?tid=24652
mode con: cols=30 lines=3
set "a=                            CN-DOS"
set b=
set "c=12345689abcde"
echo\
:c
for /l %%a in (6,1,28) do (
set /a d=%random%%%13+1
call :pp %%a
)
goto c
:pp
set/p=!a:~-%1!<nul
set/p=!b:~0,%1!<nul
color 0!c:~%d%,1!
goto :eof