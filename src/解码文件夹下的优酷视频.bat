@echo off
setlocal enabledelayedexpansion
set ffmpeg="D:\Program Files (x86)\YouKu\YoukuClient\nplayer\ffmpeg.exe"
if exist %ffmpeg% (
	for /r . %%i in (*.kux) do (
		%ffmpeg% -y -i "%%i" -c:a copy -c:v copy -threads 2 "%%~dpni.mp4"
		
	)
) else echo

pause