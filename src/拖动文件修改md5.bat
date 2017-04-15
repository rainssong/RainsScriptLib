echo off
echo ### 修改媒体文件MD5值 (im3guo@qq.com作品) ##
echo .
fsutil file createnew %~dp1\a1109.txt 16
copy /b %1+%~dp1\a1109.txt zzz_%~nx1
del /q /s %~dp1\a1109.txt
echo .
echo .已经完成了
pause
