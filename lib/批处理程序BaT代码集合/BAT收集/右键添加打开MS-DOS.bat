@echo off
reg add "HKCR\*\shell\ms-dos" /ve /d ms-dos /f
reg add "HKCR\*\shell\ms-dos\command"  /ve /d "cmd.exe /k cd %%1"  /f
reg add "HKCR\Folder\shell\ms-dos" /ve /d ms-dos /f
reg add "HKCR\Folder\shell\ms-dos\command" /ve /d "cmd.exe /k cd %%1" /f
