@echo off 
reg add HKCR\.bat\ShellNew /v nullfile /f >nul 
reg add HKCR\batfile /ve /d testbat /f >nul