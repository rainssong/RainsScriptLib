@echo off
:: 比较A文件夹和B文件夹下文件名的异同(A和B文件夹下均无子目录)
:: 如果有不同，A文件夹中不同的写入a.txt，B文件夹中不同的写入b.txt
:: 相同部分的文件名写入c.txt
:: code by jm 2006-8 CMD@XP
cd.>a.txt
cd.>b.txt
cd.>c.txt
dir /a-d /b "A文件夹的路径">list_a.txt
dir /a-d /b "B文件夹的路径">list_b.txt
for /f "delims=" %%i in (list_a.txt) do (
    find "%%i" list_b.txt>nul 2>nul && echo %%i>>c.txt || echo %%i>>a.txt
)
for /f "delims=" %%i in (list_b.txt) do (
    find "%%i" list_a.txt>nul 2>nul || echo %%i>>b.txt
)
del /q list_a.txt>nul 2>nul
del /q list_b.txt>nul 2>nul
start a.txt
start b.txt
start c.txt
goto :eof

另外一种更简洁的方案是：
:: 参照了3742668版主的思路
@echo off
cd.>a.txt
cd.>b.txt
cd.>c.txt
dir /a-d /b "A文件夹的路径">list_a.txt
dir /a-d /b "B文件夹的路径">list_b.txt
findstr /v /x /g:list_b.txt list_a.txt>a.txt
findstr /v /x /g:list_a.txt list_b.txt>b.txt
findstr /x /g:list_a.txt list_b.txt>c.txt