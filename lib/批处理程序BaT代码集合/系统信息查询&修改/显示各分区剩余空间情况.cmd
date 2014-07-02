@echo off & setlocal EnableDelayedExpansion
:: Code by willsort 2006-6-12 CMD@XP
:: Modified by JM 2007-1-15
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=19738
color 2e
title 各分区剩余空间情况
echo.
echo.
echo        ╔══════════════════════════════╗
echo        ║        磁盘分区         磁盘卷标名      剩余空间(MB)       ║
echo        ║    _____________________________________________________   ║
for %%d in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist %%d:\nul (
        for /f "tokens=3" %%z in ('dir /-c %%d:\') do set freesize=%%z
        set /a freesize=!freesize:~0,-3!/1049>nul
        set freesize=         !freesize!
        set freesize=!freesize:~-9!
        for /f "tokens=3*" %%v in ('vol %%d:') do set volume=%%w
        set volume=                    !volume!
        set volume=!volume:~-20!
        echo        ║           %%d: !volume!     !freesize!            ║
    )
)
echo        ╚══════════════════════════════╝
pause>nul