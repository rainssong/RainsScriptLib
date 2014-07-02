@echo off
color f4
echo 特别提醒! 请不要修改C: !&PAUSE>NUL
COLOR 07
cls
    set/p a=请输入原盘符……  
    set/p b=请输入新盘符……  
    set old=%a%:
    set new=%b%:
    pushd %new% 2>nul && echo %new%盘已经存在! && pause && goto :eof
    for /f %%i in ('mountvol %old% /l') do set "vol=%%i"
    mountvol %old% /d
    mountvol %new% %vol%
    popd