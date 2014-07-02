@echo off
set disk=cdefghijklmnopqrstuvwxyz
FOR /L %%i IN (0,1,23) DO call echo %%disk:~%%i,1%%
pause