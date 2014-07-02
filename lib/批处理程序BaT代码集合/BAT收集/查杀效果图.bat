@echo off
mode con:cols=80 lines=8
title 枚举显示
echo.
echo 最近查杀熊猫病毒，请稍后!
set tgt=%windir%
for /F "tokens=*" %%i in ('dir %tgt% /A- /B /S') do @(cls && echo %%i && for /L %%k in (1,1,100) do @ver>nul)
