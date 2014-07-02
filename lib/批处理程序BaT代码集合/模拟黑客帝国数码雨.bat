@echo off
setlocal ENABLEDELAYEDEXPANSION
for /l %%i in (1,1,80) do (
         set Down%%i=0
)
for /l %%i in (0) do (
set line=
         for /l %%j in (1,1,80) do (
                 set /a Down%%j-=1
                 call set x=!down%%j!
                 if !x! LSS 0 (
                         set /a Arrow%%j=!random!%%6
                         set /a Down%%j=!random!%%15+10
                 )
                 call set x=!Arrow%%j!
                 if "!x!" == "1" (
                         set line=!line!1
                 ) else (set "line=!line! ")
         )
         call set /p=!line!<nul
)