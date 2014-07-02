@echo off
:: 删除重复的行，但不能保留空行
:: 对不符合变量命名规则、变量个数超过限制的文本都无法正确处理
:: code by  youxi01 modified by jm 2006-10-31
(echo 清除重复行后的文件内容：& echo.)>str_.txt
for /f "delims=" %%i in (test.txt) do (
    if not defined %%i set %%i=A & echo %%i>>str_.txt)
start str_.txt