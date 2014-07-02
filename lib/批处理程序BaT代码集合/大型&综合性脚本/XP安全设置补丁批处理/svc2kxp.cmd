@echo off
cls
rem Copyright (C) 2003-05 Ansgar Wiechers & Torsten Mann
rem Contact: admin@ntsvcfg.de
rem
rem This program is free software; you can redistribute it and/or modify it under
rem the terms of the GNU General Public License as published by the Free Software Foundation;
rem either version 2 of the License, or (at your option) any later version.
rem This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
rem without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
rem See the GNU General Public License for more details.
rem
rem You should have received a copy of the GNU General Public License along with this program;
rem if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston,
rem MA 02111-1307, USA.
echo.
REM Tested on ... WinXP_SP2
REM Always basic XP64 Support
REM Modifications to BITS service (cause of v5 WindowsUpdate) - #discharged#
REM Additional notices corresponding to DHCP issue
REM Variables problems during RESTORE_DEFAULT usage fixed
REM SMBDEVICEENABLED Restore Bug fixed
REM Mod_history-09-27-2005**11-08-2005**11-29-2005**12-07-2005**12-18-2005

setlocal

REM *** INIT_VARS ***
set CHK_SVC=YES
set XPSP2=FALSE
set SERVER=FALSE
set NT_SERVER_CHK=TRUE


:START
echo  "svc2kXp.cmd" v2.2_build7b (18.12.2005), published under GNU GPL
echo  ================================================================
set find=%SystemRoot%\System32\find.exe
set regedit=%SystemRoot%\regedit.exe
if not exist "%find%" goto :NOFIND
if not exist "%regedit%" goto :NOREGEDIT
if not "%1" == "%*" goto :SYNTAX
if /I "%1"=="/?" goto :HELP
if /I "%1"=="/help" goto :HELP
if /I "%1"=="-h" goto :HELP
if /I "%1"=="--help" goto :HELP
if /I "%1"=="-?" goto :HELP
if /I "%1"=="--?" goto :HELP
if /I "%1"=="/fix" goto :FIX
goto :VERSION

:SYNTAX
echo.
echo.
echo  !!Syntax error!!
echo  ________________
echo  Es kann nur ein oder kein Parameter angegeben werden.
echo.
echo  Only one or no parameter allowed.
goto :QUIT

:HELP
echo.
echo                                 -= Hilfe =-
echo  Parameter:
echo  /lan.......Einige Dienste fuer LAN-Betrieb werden nicht veraendert.
echo  /std.......Schliesst alle Ports, einige Dienste bleiben unveraendert.
echo  /all.......Setzt alle Vorschlaege nach www.ntsvcfg.de um (hardening).
echo  /restore...Nimmt die zuletzt vorgenommenen Aenderungen zurueck.
echo  /reLAN.....Reaktiviert Dienste, die fuer LAN-Betrieb benoetigt werden.
echo  /default...Setzt alle Diensteinstellungen auf ursprüngliche Werte zurück.
echo.
echo  Parameters:
echo  /lan.......Some services needed for LAN-usage stay unchanged!
echo  /std.......Closes all Ports, but some services stay unchanged
echo  /all.......Changes all issues recommended by www.ntsvcfg.de ("hardening")
echo  /restore...Undo last changes.
echo  /reLAN.....Reactivates services required for LAN.
echo  /default...Restoring factory service settings (before first time usage)
echo.
echo  example: svc2kxp.cmd /all
echo.
set /P CHS= [Press "G" for GNU GPL informations or "Q" for quit]?
if /I "%CHS%"=="G" goto :GNU_GPL
if /I "%CHS%"=="Q" goto :QUIT_EXT
CLS
goto :HELP

:GNU_GPL
CLS
echo  Informations about GNU-General Public License for "svc2kxp.cmd"
echo  ===============================================================
echo.
echo  Copyright (C) 2003-05 Ansgar Wiechers, Torsten Mann
echo  Contact: admin@ntsvcfg.de
echo.
echo  This program is free software; you can redistribute it and/or modify it under
echo  the terms of the GNU General Public License as published by the Free Software
echo  Foundation; either version 2 of the License, or (at your option) any later
echo  version. This program is distributed in the hope that it will be useful, but
echo  WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
echo  FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
echo  details.
echo.
echo  You should have received a copy of the GNU General Public License along with
echo  this program; if not, write to the:
echo.
echo  Free Software Foundation, Inc.
echo  59 Temple Place, Suite 330
echo  Boston, MA 02111-1307, USA.
echo.
set /P CHS= [Press "H" for help or "Q" for quit]?
CLS
if /I "%CHS%"=="H" goto :HELP
if /I "%CHS%"=="Q" goto :QUIT_EXT
goto GNU_GPL

:VERSION
echo  Checking system version ...


if /I "%NT_SERVER_CHK%"=="FALSE" goto :SKIP_NT_SERVER_CHK
REM Checking for running server version
        "%regedit%" /e "%TEMP%\~svr.txt" "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\ProductOptions"
                 type "%TEMP%\~svr.txt"|"%find%" /i "Server" >NUL
                if not errorlevel 1 set SERVER=TRUE
                 type "%TEMP%\~svr.txt"|"%find%" /i "LanMan" >NUL
                if not errorlevel 1 set SERVER=TRUE
                if exist "%TEMP%\~svr.txt" del /F /Q "%TEMP%\~svr.txt"
                if /I "%SERVER%"=="TRUE" goto :NTSERVER


:SKIP_NT_SERVER_CHK

ver | "%find%"  /i "Windows 2000" > nul
if not errorlevel 1 goto :OS2K

ver | "%find%"  /i "Windows XP" > nul
if not errorlevel 1 goto :OSXP

ver | "%find%"  /i "Microsoft Windows [Version 5.2.3790]" > nul
if not errorlevel 1 goto :OSXP64

echo  !!Failed!!
echo  __________
echo.
echo  Dieses Script ist nur unter Windows 2000 oder XP lauffaehig!
echo.
echo  This script works only on Windows 2000/XP machines!
echo.
goto :QUIT

:NOFIND
echo.
echo  !!Failed!!
echo  __________
echo.
echo  Leider konnte folgende Datei nicht gefunden werden:
echo.
echo  Sorry, but following file is missing:
echo.
echo.
echo  # %SystemRoot%\System32\FIND.EXE
echo.
echo.
goto :QUIT

:NOREGEDIT
echo.
echo  !!Failed!!
echo  __________
echo.
echo  Leider konnte folgende Datei nicht gefunden werden:
echo.
echo  Sorry, but following file is missing:
echo.
echo.
echo  # %SystemRoot%\REGEDIT.EXE
echo.
echo.
goto :QUIT

:NTSERVER
echo.
echo  !!Failed!!
echo  __________
echo.
echo  Dieses Script unterstuetzt keine NT Server Versionen!
echo.
echo  This script doesn't support NT server versions!
echo.
goto :QUIT


:OS2K
rem Specific OS Detection I
set SYSTEM=2k

rem Testing for XP ServicePacks

        "%regedit%" /e "%TEMP%\~svclist.txt" "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion"
        type "%TEMP%\~svclist.txt"|"%find%" /i "Service Pack 4" >NUL
        if errorlevel==1 (

                  type "%TEMP%\~svclist.txt"|"%find%" /i "Service Pack 3" >NUL
                  if errorlevel==1 (

                        type "%TEMP%\~svclist.txt"|"%find%" /i "Service Pack 2" >NUL
                          if errorlevel==1 (

                                type "%TEMP%\~svclist.txt"|"%find%" /i "Service Pack 1" >NUL
                                if errorlevel==1 (

                                        echo  !Windows 2000 [no or unknown Service Pack] detected!
                                        goto NO_2KSP
                                        )

                                echo  !Windows 2000 [Service Pack 1] detected!
                                  goto :NO_2KSP
                                )


                        echo  !Windows 2000 [Service Pack 2] detected!
                          goto :NO_2KSP
                        )


                echo  !Windows 2000 [Service Pack 3] detected!
                goto :NO_2KSP
                )


        echo  !Windows 2000 [Service Pack 4] detected!
        goto :NO_2KSP

:NO_2kSP
if exist "%TEMP%\~svclist.txt" del /F /Q "%TEMP%\~svclist.txt"
goto :CONTINUE


:OSXP
rem Specific OS detection II
set SYSTEM=xp
rem Testing for XP ServicePack 2

        "%regedit%" /e "%TEMP%\~svclist.txt" "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion"
        type "%TEMP%\~svclist.txt"|"%find%" /i "Service Pack 2" >NUL
        if errorlevel==1 (

                  type "%TEMP%\~svclist.txt"|"%find%" /i "Service Pack 1" >NUL
                  if errorlevel==1 (

                        SET XPSP2=FALSE
                        echo  !Windows XP [no or unknown Service Pack] detected!
                        goto NO_XPSP
                        )

                SET XPSP2=FALSE
                  echo  !Windows XP [Service Pack 1] detected!
                  goto :NO_XPSP
                )

        SET XPSP2=TRUE
        echo  !Windows XP [ServicePack 2] detected!
        goto :NO_XPSP

:OSXP64
rem Specific OS detection II
set SYSTEM=xp
rem Testing for XP ServicePack 2

        "%regedit%" /e "%TEMP%\~svclist.txt" "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion"
        type "%TEMP%\~svclist.txt"|"%find%" /i "Service Pack 2" >NUL
        if errorlevel==1 (

                  type "%TEMP%\~svclist.txt"|"%find%" /i "Service Pack 1" >NUL
                  if errorlevel==1 (

                        SET XPSP2=FALSE
                        echo  !EXPERIMENTAL! Windows XP64 [no or unknown Service Pack] detected!
                        goto NO_XPSP
                        )

                SET XPSP2=FALSE
                  echo  !EXPERIMENTAL! Windows XP64 [Service Pack 1] detected!
                  goto :NO_XPSP
                )

        SET XPSP2=TRUE
        echo  !EXPERIMENTAL! Windows XP64 [ServicePack 2] detected!
        goto :NO_XPSP


:NO_XPSP
if exist "%TEMP%\~svclist.txt" del /F /Q "%TEMP%\~svclist.txt"
goto :CONTINUE


:CONTINUE

REM Creating subdirectory "ntsvcfg" in userprofile if necessary
if not exist "%USERPROFILE%\ntsvcfg\*.*" mkdir "%USERPROFILE%\ntsvcfg"

REM Moving old script backup files to ...\%USERNAME%\ntsvcfg :
        if exist "%USERPROFILE%\dcom.reg" move /Y "%USERPROFILE%\dcom.reg" "%USERPROFILE%\ntsvcfg\dcom.reg"
        if exist "%USERPROFILE%\dcomp.reg" move /Y "%USERPROFILE%\dcomp.reg" "%USERPROFILE%\ntsvcfg\dcomp.reg"
        if exist "%USERPROFILE%\services.reg" move /Y "%USERPROFILE%\services.reg" "%USERPROFILE%\ntsvcfg\services.reg"
        if exist "%USERPROFILE%\current_services_config.reg" move /Y "%USERPROFILE%\current_services_config.reg" "%USERPROFILE%\ntsvcfg\current_services_config.reg"
        if exist "%USERPROFILE%\smb.reg" move /Y "%USERPROFILE%\smb.reg" "%USERPROFILE%\ntsvcfg\smb.reg"
        if exist "%USERPROFILE%\FPRINT.REF" move /Y "%USERPROFILE%\FPRINT.REF" "%USERPROFILE%\ntsvcfg\FPRINT.REF"
        if exist "%USERPROFILE%\handler_aim.reg" move /Y "%USERPROFILE%\handler_aim.reg" "%USERPROFILE%\ntsvcfg\handler_aim.reg"
        if exist "%USERPROFILE%\handler_gopher.reg" move /Y "%USERPROFILE%\handler_gopher.reg" "%USERPROFILE%\ntsvcfg\handler_gopher.reg"
        if exist "%USERPROFILE%\handler_telnet.reg" move /Y "%USERPROFILE%\handler_telnet.reg" "%USERPROFILE%\ntsvcfg\handler_telnet.reg"
        if exist "%USERPROFILE%\services.reg.default" move /Y "%USERPROFILE%\services.reg.default" "%USERPROFILE%\ntsvcfg\services.reg.default"
        if exist "%USERPROFILE%\dcom.reg.default" move /Y "%USERPROFILE%\dcom.reg.default" "%USERPROFILE%\ntsvcfg\dcom.reg.default"
        if exist "%USERPROFILE%\dcomp.reg.default" move /Y "%USERPROFILE%\dcomp.reg.default" "%USERPROFILE%\ntsvcfg\dcomp.reg.default"
        if exist "%USERPROFILE%\smb.reg.default" move /Y "%USERPROFILE%\smb.reg.default" "%USERPROFILE%\ntsvcfg\smb.reg.default"
        if exist "%USERPROFILE%\handler_aim.reg.default" move /Y "%USERPROFILE%\handler_aim.reg.default" "%USERPROFILE%\ntsvcfg\handler_aim.reg.default"
        if exist "%USERPROFILE%\handler_gopher.reg.default" move /Y "%USERPROFILE%\handler_gopher.reg.default" "%USERPROFILE%\ntsvcfg\handler_gopher.reg.default"
        if exist "%USERPROFILE%\handler_telnet.reg.default" move /Y "%USERPROFILE%\handler_telnet.reg.default" "%USERPROFILE%\ntsvcfg\handler_telnet.reg.default"


REM *****Declarations*****
set SELECT="no"
set SVC_BAK=%USERPROFILE%\ntsvcfg\services.reg
set SVC_SAV=%USERPROFILE%\ntsvcfg\current_services_config.reg
set DCOM_BAK=%USERPROFILE%\ntsvcfg\dcom.reg
set DCOMP_BAK=%USERPROFILE%\ntsvcfg\dcomp.reg
set SMB_BAK=%USERPROFILE%\ntsvcfg\smb.reg
set DCOM_TMP=%TEMP%\dcomoff.reg
set DCOMP_TMP=%TEMP%\dcompoff.reg
set SMB_TMP=%TEMP%\smboff.reg
set FPRINT=%USERPROFILE%\ntsvcfg\FPRINT.REF
set HANDLER1=%USERPROFILE%\ntsvcfg\handler_aim.reg
set HANDLER2=%USERPROFILE%\ntsvcfg\handler_gopher.reg
set HANDLER3=%USERPROFILE%\ntsvcfg\handler_telnet.reg
set NB_TMP=%TEMP%\nb_off.vbs
set srctmp=%USERPROFILE%\ntsvcfg\~srcreate.vbs
set DHCP_CHANGES="YES"

REM *****Options*****
set SCHEDULER_ENABLED=NO
set UseXPSysRestore=YES
set RESTORE=NO
set SVC_MOD=NO
set USE_FPRINT=YES
set Deactivate_NetBIOS=YES
set RESTORE_MODE=2

REM *****APP_PATHs******
set NET=%SystemRoot%\system32\net.exe
set SC=%SystemRoot%\system32\sc.exe
set FC=%SystemRoot%\system32\fc.exe
set IPCONFIG=%SystemRoot%\system32\ipconfig.exe


echo  Checking available permissions: [local], please wait ...
"%net%" user "%USERNAME%" 2> nul | "%find%"  /i "admin" | "%find%"  /i /v "name" > nul
if errorlevel 1 (
        echo     "         "          "     : [domain], please wait ...
        "%net%" user "%USERNAME%" /domain 2> nul | "%find%"  /i "admin" | "%find%"  /i /v "name" > nul
        if errorlevel 1 (
                echo.
                echo  Failed!
                echo  __________
                echo  Leider verfuegen Sie nicht ueber die erforderlichen Rechte!
                echo  Melden Sie sich bitte als Administrator an.
                echo.
                echo  Sorry but you don't have the permissions required for this task.
                echo  Please login as Administrator.
                echo.
                goto :END
                )
        )

set IMPORT_OLD_FILES=FALSE
rem searching for sc.exe
if not exist "%FPRINT%" echo  Checking for presence of SC.EXE ...
"%sc%" qc > nul 2>&1
if errorlevel 1 (
        echo  !!Failed!!
        echo  __________
        echo  Die notwendige Datei SC.EXE konnte leider nicht unter
        echo  [%SystemRoot%\SYSTEM32\] gefunden werden.
        echo  Bitte laden Sie sich diese Datei von der unten genannten Adresse herunter:
        echo.
        echo  SC.EXE couldn't be found in [%SystemRoot%\SYSTEM32\].
        echo  Please download it from following location:
        echo.
        echo.
        echo            -= ftp://ftp.microsoft.com/reskit/win2000/sc.zip =-
        echo.
        echo                                Self-installing SC.EXE
        echo                                ======================
        echo  svx2kxp.cmd kann versuchen, die notwendige Datei selbst zu installieren.
        echo  Hierzu benoetigen Sie eine bestehende Internetverbindung.
        echo.
        echo  svc2kxp.cmd may try to download the required file SC.EXE itself if an
        echo  active internet connection exists.
        goto :SC_DOWNLOAD
        )


if /I "%1"=="/all" (
        set SELECT="/all"
        goto :SKIP_MENUE
        )

if /I "%1"=="/relan" (
        set SELECT="/relan"
        goto :SKIP_MENUE
        )

if /I "%1"=="/std" (
        set SELECT="/std"
        goto :SKIP_MENUE
        )

if /I "%1"=="/default" goto :RESTORE_DEFAULTS


rem checking for modified services
if /I %CHK_SVC%==YES (
        if /I %USE_FPRINT%==YES (
                if exist "%FPRINT%" (
                        rem Creating fingerprint of current service settings...
                        if exist "%USERPROFILE%\ntsvcfg\svc2cmp.sav" del /F /Q "%USERPROFILE%\ntsvcfg\svc2cmp.sav"
                        "%sc%" query type= service state= all bufsize= 8192 | %FIND% "SERVICE_NAME" >%TEMP%\~svclist.txt
                        for /F "tokens=1*" %%a in (%TEMP%\~svclist.txt) do (
                                echo %%b >>"%USERPROFILE%\ntsvcfg\svc2cmp.sav"
                                "%sc%" query "%%b" | %FIND% "STATE" >>"%USERPROFILE%\ntsvcfg\svc2cmp.sav"
                                "%sc%" qc "%%b" | %FIND% "DISPLAY_NAME" >>"%USERPROFILE%\ntsvcfg\svc2cmp.sav"
                                "%SC%" qc "%%b" | %FIND% "START_TYPE" >>"%USERPROFILE%\ntsvcfg\svc2cmp.sav"
                                echo. >> "%USERPROFILE%\ntsvcfg\svc2cmp.sav"
                                )
                        del "%TEMP%\~svclist.txt"


                        "%FC%" "%FPRINT%" "%USERPROFILE%\ntsvcfg\svc2cmp.sav" >NUL
                        if errorlevel 1 goto :DIFF
                        goto OK

                        :DIFF
                        echo  Checking for modified services ... failed-services maybe modified! [E]valuate
                        set SVC_MOD=YES
                        goto :MOD_END

                        :OK
                        echo  Checking for modified services ... OK
                        set SVC_MOD=NO
                        if exist "%USERPROFILE%\ntsvcfg\svc2cmp.sav" del /F /Q "%USERPROFILE%\ntsvcfg\svc2cmp.sav"
                        goto :MOD_END

                        :MOD_END
                        REM
                        )
                )
        )
set CHK_SVC=NO


if /I "%1"=="/restore" goto :RESTORE


:MENUE
if /I "%1"=="/lan" goto :SKIP_MENUE
echo.
echo                            -= Auswahl / Overview =-
echo.
echo  Bitte waehlen sie einen Punkt aus, den sie ausfuehren moechten:
echo.
echo  (1) LAN:       Einige Dienste fuer LAN-Betrieb werden nicht veraendert.
echo  (2) Standard:  Schliesst alle Ports, aber einige Dienste bleiben unveraendert.
echo  (3) ALL:       Setzt alle Vorschlaege nach www.ntsvcfg.de um (hardening).
echo  (4) Restore:   Nimmt die zuletzt vorgenommenen Aenderungen zurueck.
echo  ______________________________________________________________________________
echo.
echo  Please choose one task you want to do:
echo.
echo  (1) LAN:       Some services needed for LAN-usage stay unchanged
echo  (2) Standard:  Close ports but some services stay unchanged
echo  (3) ALL:       Making all changes described at www.ntsvcfg.de (hardening)
echo  (4) restore:   Restores last changes made.
echo.
set /P CHS= Bitte waehlen Sie/Please choose: [1],[2],[3],[4], [M]ore options or [Q]uit?

if /I "%CHS%"=="1" (
        set SELECT="/lan"
        goto :SKIP_MENUE
        )

if /I "%CHS%"=="2" (
        set SELECT="/std"
        goto :SKIP_MENUE
        )

if /I "%CHS%"=="3" (
        set SELECT="/all"
        goto :SKIP_MENUE
        )

if /I "%CHS%"=="4" goto :RESTORE
if /I "%CHS%"=="R" goto :RESTORE
if /I "%CHS%"=="M" goto :MORE_OPTIONS
if /I "%SVC_MOD%"=="YES" if /I "%CHS%"=="E" goto :EVALUATE_SERVICES
if /I "%CHS%"=="G" goto :CREATING_NEW_FINGERPRINT
if /I "%CHS%"=="Q" goto :QUIT
cls
goto :START


:SKIP_MENUE



rem Checking if old restorefiles exists.
rem if it is so old files will be restored before new changes
if not exist "%SVC_BAK%" goto :NO_RESTORE
if /I %RESTORE_MODE%==3 goto :NO_RESTORE
if /I %RESTORE_MODE%==4 goto :NO_RESTORE
set RESTORE=YES
echo.
echo  _______________________________________________________________________
echo.
echo  [Selected Restore Mode: %RESTORE_MODE%]
echo.
echo  # Achtung: Alte Sicherungsdateien gefunden!
echo.
echo     "Svc2kXp.cmd" wurde schon einmal ausgefuehrt. Damit neue Aenderungen
echo     korrekt durchgefuehrt werden koennen, werden die Sicherungsdateien
echo     eingespielt.
echo.
echo.
echo    Attention: old restore-files found!
echo.
echo     This program runs not for the first time. To apply all new changes
echo     correctly old restore files will used to get an definite state.
echo.
echo.
echo  # Starting restore ...
goto RESTORE_EXT



:NO_RESTORE
rem query if taskplaner should run
if /I "%SYSTEM%"=="2k" goto :SKIP_SQUERY
if /I "%SYSTEM%"=="xp" (
        if /I %SELECT%=="" goto :SKIP_SQUERY
        if /I %SELECT%=="/all" goto :SKIP_SQUERY
        if /I %XPSP2%==True (
                set SCHEDULER_ENABLED=YES
                goto :SKIP_SQUERY
                )

        )


echo.
echo.
echo  Rueckfrage / Query
echo  ==================
echo.
echo  Soll der Dienst "Taskplaner" beendet werden?
echo.
echo  Wenn sie zeitgesteuerten Aufgaben [z.B. Antiviren-Updates] oder die automati-
echo  sche Erstellung von Systemwiederherstellungspunkten nicht benoetigen, druecken
echo  Sie eine BELIEBIGE TASTE, um auch Port 135 [RPC] sowie Port 1025 [Taskplaner]
echo  zu schliessen [empfohlen!]. Andernfalls druecken Sie "N"!
echo.
echo.
echo  Should the "scheduler service" be disabled?
echo.
echo  If you have time-controlled tasks [i.e. AV-Updates] or you will not set
echo  automatic system restore points press ANY KEY TO CONTINUE to close port 135
echo  [RPC] and port 1025 [scheduler] instantly. Otherwise press "N"
echo  ___________________________________________
echo.
set /P UNDO= Taskplaner beenden - Close scheduler [y/n]?
if /I "%UNDO%"=="n" set SCHEDULER_ENABLED=YES



:SKIP_SQUERY

if not exist "%SVC_BAK%.default" (
        echo.
        echo  Creating backup of defaults ...
        "%regedit%" /e "%SVC_BAK%.default" HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services
        "%regedit%" /e "%DCOM_BAK%.default" HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Ole
        "%regedit%" /e "%DCOMP_BAK%.default" HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Rpc
        "%regedit%" /e "%SMB_BAK%.default" HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetBT\Parameters
        "%regedit%" /e "%HANDLER1%.default" HKEY_CLASSES_ROOT\AIM
        "%regedit%" /e "%HANDLER2%.default" HKEY_CLASSES_ROOT\gopher
        "%regedit%" /e "%HANDLER3%.default" HKEY_CLASSES_ROOT\telnet
        echo                             ... done.
        )

if exist "%SVC_BAK%" (
        if /I %RESTORE_MODE%==2 goto :SKIP_SAVING
        if /I %RESTORE_MODE%==4 goto :SKIP_SAVING
        )

rem saving registry settings
echo  _________________________________________________________________________
echo.
echo  [Selected Restore Mode: %RESTORE_MODE%]
echo.
echo     Saving services settings to
echo       %SVC_BAK% ...
"%regedit%" /e "%SVC_BAK%" HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services
echo     Saving DCOM settings to
echo       %DCOM_BAK% ...
"%regedit%" /e "%DCOM_BAK%" HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Ole
echo     Saving DCOM standard protocols settings to
echo       %DCOMP_BAK% ...
"%regedit%" /e "%DCOMP_BAK%" HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Rpc
echo     Saving SMB settings to
echo       %SMB_BAK%
"%regedit%" /e "%SMB_BAK%" HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetBT\Parameters
echo     Saving URL-Handler [AIM, GOPHER, TELNET] to
echo       %HANDLER1%
"%regedit%" /e "%HANDLER1%" HKEY_CLASSES_ROOT\AIM
echo       %HANDLER2%
"%regedit%" /e "%HANDLER2%" HKEY_CLASSES_ROOT\gopher
echo       %HANDLER3%
"%regedit%" /e "%HANDLER3%" HKEY_CLASSES_ROOT\telnet
echo.

echo  All done.
echo  ___________________________________________
echo.


:SKIP_SAVING

if /I "%SYSTEM%"=="xp" (
        if /I %UseXPSysRestore%==YES (
                goto :XPSYSRESTORE
                )
        )
:XPSYSRESTORE_DONE

rem reconfigure services
rem startup: demand
echo.
echo  Setting services to "demand" ...

echo  ___________________________________________
echo.
echo  # Checking DHCP ...
"%ipconfig%" -all | "%find%"  /i "Lease" > nul
if errorlevel 1 (
        rem trying other method for DHCP
        "%ipconfig%" -all | "%find%"  /i "DHCP-Server" > nul
        if errorlevel 1 (
          echo                ... no active DHCP found.
          echo.
	  echo  Hinweis
	  echo  =======
	  echo  Ihre Konfiguration deutet an, das kein DHCP benoetigt wird. Falls
          echo  Sie dennoch einen DSL-Internetzugang besitzen und DHCP irrtuemlich 
	  echo  deaktivert wurde, kann es nach einem Neustart zu Problemen mit der 
	  echo  Internetverbindung kommen. Starten sie zur Problembehebung den 
	  echo  DHCP-Dienst manuell neu.
	  echo.
	  echo  Notice
	  echo  ======
	  echo  Your configuration indicates that DHCP no longer will be required.
	  echo  But if you use a DSL internet connection this choice probably 
          echo  might be wrong. If you experiences problems during accessing the 
	  echo  internet please re-activate the "DHCP Service" manually.
	  echo.
	  echo  ___________________________________________
	  echo.
          "%sc%" config DHCP start= demand
          goto :SKIP_DHCP
        )
)
set DHCP_CHANGES="NO"
echo  ... DHCP active, status of service will NOT be changed!
echo.

:SKIP_DHCP
"%sc%" config dmadmin start= demand
"%sc%" config DNSCache start= demand
"%sc%" config mnmsrvc start= demand
"%sc%" config MSIServer start= demand
"%sc%" config NetDDE start= demand
"%sc%" config NetDDEdsdm start= demand
"%sc%" config Netman start= demand
"%sc%" config NTLMSsp start= demand
"%sc%" config NtmsSvc start= demand
"%sc%" config PolicyAgent start= demand
"%sc%" config RASAuto start= demand
"%sc%" config RASMan start= demand
"%sc%" config RSVP start= demand
"%sc%" config Scardsvr start= demand

"%sc%" query ScardDrv | "%find%"  /i "OpenService FAILED" >NUL
if errorlevel 1 "%sc%" config ScardDrv start= demand

if /I %XPSP2%==True (
        rem If XP SP2 is installed there are less changes to XP-ICF
        if /I %SELECT%=="/std" goto :SKIP_FIREWALL
        )
"%sc%" config SharedAccess start= demand

:SKIP_FIREWALL
"%sc%" config Sysmonlog start= demand
"%sc%" config TAPISrv start= demand
"%sc%" config TrkWks start= demand
"%sc%" config UPS start= demand
"%sc%" config W32Time start= demand
"%sc%" config WMI start= demand

if /I %SELECT%=="/all" (
        "%sc%" config SamSs start= demand
        "%sc%" config LmHosts start= demand
        "%sc%" config Winmgmt start= demand
        )

if /I "%SYSTEM%"=="2k" (
        "%sc%" config AppMgmt start= demand
        "%sc%" config Browser start= demand
        "%sc%" config clipsrv start= demand
        "%sc%" config EventSystem start= demand
        "%sc%" config Fax start= demand
        "%sc%" config netlogon start= demand
        "%sc%" config RPCLocator start= demand
        "%sc%" config Utilman start= demand
        if /I %SELECT%=="/all" (
                "%sc%" config seclogon start= demand
                "%sc%" config RPCSs start= demand
                "%sc%" config lanmanServer start= demand
                )
        )


if /I "%SYSTEM%"=="xp" (
        "%sc%" config ALG start= demand
        "%sc%" config FastUserSwitchingCompatibility start= demand
        "%sc%" config helpsvc start= demand
        "%sc%" config ImapiService start= demand
        "%sc%" config Nla start= demand
        "%sc%" config RdSessMgr start= demand
        "%sc%" config seclogon start= demand
        "%sc%" config stisvc start= demand
        "%sc%" config SwPrv start= demand
        "%sc%" config TermService start= demand
        "%sc%" config upnphost start= demand
        "%sc%" config VSS start= demand

        "%sc%" query WmdmPmSp | "%find%"  /i "OpenService FAILED" >NUL
        if errorlevel 1 "%sc%" config WmdmPmSp start= demand

        "%sc%" config WmiApSrv start= demand
        rem Wireless Zero Configuration - fuer WLAN-Verbindungen notwendig.
        rem Falls erforderlich auf AUTO stellen.
        rem "%sc%" config WZCSVC start= demand
        )
echo.




rem startup: auto
echo  Setting services to "auto" ...
"%sc%" config dmserver start= auto
"%sc%" config eventlog start= auto
"%sc%" config PlugPlay start= auto
"%sc%" config ProtectedStorage start= auto
"%sc%" config sens start= auto
"%sc%" config spooler start= auto

if /I "%SYSTEM%"=="2k" (
        "%sc%" config lanmanworkstation start= auto
        "%sc%" config alerter start= auto
        )

if /I "%SYSTEM%"=="xp" (
        "%sc%" query InteractiveLogon | "%find%"  /i "OpenService FAILED" >NUL
        if errorlevel 1 "%sc%" config InteractiveLogon start= auto
        "%sc%" config Audiosrv start= auto
        "%sc%" config CryptSvc start= auto
        "%sc%" config RPCSs start= auto
        "%sc%" config ShellHWDetection start= auto
        "%sc%" config srservice start= auto
        "%sc%" query uploadmgr | "%find%"  /i "OpenService FAILED" >NUL
        if errorlevel 1 "%sc%" config uploadmgr start= auto
        "%sc%" config WebClient start= auto
        )
echo.





rem startup: disabled
echo  Setting services to "disabled" ...
"%sc%" config cisvc start= disabled
"%sc%" config MSDTC start= disabled
"%sc%" config RemoteAccess start= disabled
"%sc%" config TlntSvr start= disabled
"%sc%" config messenger start= disabled


if /I %SELECT%=="/all" (
        "%sc%" query BITS | "%find%"  /i "SERVICE_NAME" >NUL
        if not errorlevel 1 "%sc%" config BITS start= disabled
        "%sc%" query wuauserv | "%find%"  /i "SERVICE_NAME" >NUL
        if not errorlevel 1 "%sc%" config wuauserv start= disabled
        "%sc%" config schedule start= disabled
        "%sc%" config RemoteRegistry start= disabled
        )

if /I "%SYSTEM%"=="xp" (
        "%sc%" config ERSvc start= disabled
        "%sc%" config HidServ start= disabled
        "%sc%" config SSDPSRV start= disabled

        if /I %SELECT%=="/lan" (
                if /I %SCHEDULER_ENABLED%==NO "%sc%" config schedule start= disabled
                )

        if /I %SELECT%=="/std" (
                if /I %SCHEDULER_ENABLED%==NO "%sc%" config schedule start= disabled
                )

        if /I %XPSP2%==True (
                echo.
                echo  XPSP2: Disabling Security Center ...
                "%sc%" config wscsvc start= disabled
                )
        )


echo.
echo  ------------------
echo  # Checking and stopping unnecessary system services ...
echo.
"%sc%" query cisvc | "%find%"  /i "4  RUNNING" >NUL
        if not errorlevel 1 "%net%" stop cisvc
"%sc%" query RemoteAccess | "%find%"  /i "4  RUNNING" >NUL
        if not errorlevel 1 "%net%" stop RemoteAccess
"%sc%" query TlntSvr | "%find%"  /i "4  RUNNING" >NUL
        if not errorlevel 1 "%net%" stop TlntSvr
"%sc%" query MSDTC | "%find%"  /i "4  RUNNING" >NUL
        if not errorlevel 1 "%net%" stop MSDTC
"%sc%" query messenger | "%find%"  /i "4  RUNNING" >NUL
        if not errorlevel 1 "%net%" stop messenger

if /I %SELECT%=="/all" (
        "%sc%" query BITS | "%find%"  /i "SERVICE_NAME" >NUL
        if not errorlevel 1 (
                "%sc%" query BITS | "%find%"  /i "4  RUNNING" >NUL
                if not errorlevel 1 "%net%" stop BITS
                )
        "%sc%" query wuauserv | "%find%"  /i "SERVICE_NAME" >NUL
        if not errorlevel 1 (
                "%sc%" query wuauserv | "%find%"  /i "4  RUNNING" >NUL
                if not errorlevel 1 "%net%" stop wuauserv
                )
        "%sc%" query schedule | "%find%"  /i "4  RUNNING" >NUL
        if not errorlevel 1 "%net%" stop schedule
        )

if /I "%SYSTEM%"=="xp" (
        if /I %SELECT%=="/lan" (
                if /I %SCHEDULER_ENABLED%==NO "%net%" (
                        "%sc%" query schedule | "%find%"  /i "4  RUNNING" >NUL
                        if not errorlevel 1 "%net%" stop schedule
                        )
                )

        if /I %SELECT%=="/std" (
                if /I %SCHEDULER_ENABLED%==NO "%net%" (
                        "%sc%" query schedule | "%find%"  /i "4  RUNNING" >NUL
                        if not errorlevel 1 "%net%" stop schedule
                )

        if /I %XPSP2%==True (
                "%sc%" query wscsvc | "%find%"  /i "4  RUNNING" >NUL
                if not errorlevel 1 "%net%" stop wscsvc
                )

        )

echo  ------------------
echo  Disabling DCOM ...
echo REGEDIT4 > "%DCOM_TMP%"
echo. >> "%DCOM_TMP%"
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Ole] >> "%DCOM_TMP%"
echo "EnableDCOM"="N" >> "%DCOM_TMP%"
echo "EnableDCOMHTTP"="N" >> "%DCOM_TMP%"
echo. >> "%DCOM_TMP%"
echo. >> "%DCOM_TMP%"
"%regedit%" /s "%DCOM_TMP%"
del /F /Q "%DCOM_TMP%"

echo  Disabling DCOM standard protocols ...
echo REGEDIT4 > "%DCOMP_TMP%"
echo. >> "%DCOMP_TMP%"
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Rpc] >> "%DCOMP_TMP%"
echo "DCOM Protocols"=hex(7):00,00,00,00 >> "%DCOMP_TMP%"
echo. >> "%DCOMP_TMP%"
echo. >> "%DCOMP_TMP%"
"%regedit%" /s "%DCOMP_TMP%"
del /F /Q "%DCOMP_TMP%"

   echo  Disabling port 135 (maybe 1025 too) ...
   echo    - Removing RPC Client Protocols
   echo REGEDIT4 > "%SMB_TMP%"
   echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Rpc\ClientProtocols] >> "%SMB_TMP%"
   echo. >> "%SMB_TMP%"

   if /I %SCHEDULER_ENABLED%==NO (
    echo    - Advanced RPC Configuration
    echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Rpc\Internet] >> "%SMB_TMP%"
    echo "PortsInternetAvailable"="N" >> "%SMB_TMP%"
    echo "UseInternetPorts"="N" >> "%SMB_TMP%"
    echo. >> "%SMB_TMP%"
    )

   if /I %XPSP2%==TRUE (
    echo    - Advanced RPC Configuration
    echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Rpc\Internet] >> "%SMB_TMP%"
    echo "PortsInternetAvailable"="N" >> "%SMB_TMP%"
    echo "UseInternetPorts"="N" >> "%SMB_TMP%"
    echo. >> "%SMB_TMP%"
    )

   echo    - Removing needless URL Handler [AIM,gopher,telnet]
   echo [-HKEY_CLASSES_ROOT\AIM] >> "%SMB_TMP%"
   echo [-HKEY_CLASSES_ROOT\gopher] >> "%SMB_TMP%"
   echo [-HKEY_CLASSES_ROOT\telnet] >> "%SMB_TMP%"
   echo. >> "%SMB_TMP%"
   echo. >> "%SMB_TMP%"
  "%regedit%" /s "%SMB_TMP%"
  del /F /Q "%SMB_TMP%"

if /I %SELECT%=="/all" (
        echo.
        echo  Disabling SMB port 445 ...
        echo REGEDIT4 > "%SMB_TMP%"
        echo. >> "%SMB_TMP%"
        echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetBT\Parameters] >> "%SMB_TMP%"
        echo "SMBDeviceEnabled"=dword:00000000 >> "%SMB_TMP%"
        echo. >> "%SMB_TMP%"
        echo. >> "%SMB_TMP%"
        "%regedit%" /s "%SMB_TMP%"
        del /F /Q "%SMB_TMP%"
        set REBOOT_REQUIRED=yes
        )

if /I %SELECT%=="/std" (
        echo.
        echo  Disabling SMB port 445 ...
        echo REGEDIT4 > "%SMB_TMP%"
        echo. >> "%SMB_TMP%"
        echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetBT\Parameters] >> "%SMB_TMP%"
        echo "SMBDeviceEnabled"=dword:00000000 >> "%SMB_TMP%"
        echo. >> "%SMB_TMP%"
        echo. >> "%SMB_TMP%"
        "%regedit%" /s "%SMB_TMP%"
        del /F /Q "%SMB_TMP%"
        set REBOOT_REQUIRED=yes
        )

if /I %SELECT%=="/std" goto :NB_DISABLE
if /I %SELECT%=="/all" goto :NB_DISABLE
goto :SKIP_NB_DISABLE

:NB_DISABLE
  if /I %DEACTIVATE_NETBIOS%==NO (
                echo.
                echo.  Due problems with SP2 and deactivating NetBIOS this option
                echo   will be skipped.
                echo.
                goto :SKIP_NB_DISABLE
                )

  rem Because of problems with SP2 Netbios:
  if /I %XPSP2%==True (
                echo.
                echo  Note:
                echo  -----
                echo  If you experiencing problems after updating Windows XP with
                echo  Service Pack 2 please do following:
                echo.
                echo                          set Deactivate_NetBIOS=NO
                echo.
                )
  rem *** Thx2 Johannes Lichtenberger for the following lines using VBScript***
  echo  Disable NetBios on all local interfaces ...
  echo.
  echo On Error Resume Next>> "%nb_tmp%"
  echo.>> "%nb_tmp%"
  echo TcpipoverNetbios = 2 '0=NetbiosfromDHCP 1=EnableNetbios 2=DisableNetbios>> "%nb_tmp%"
  echo.>> "%nb_tmp%"
  echo strComputer = ".">> "%nb_tmp%"
  echo Set objWMIService = GetObject("winmgmts:\\" ^& strComputer ^& "\root\cimv2")>> "%nb_tmp%"
  echo Set objNICs = objWMIService.ExecQuery _>> "%nb_tmp%"
  echo    ("Select * From Win32_NetworkAdapterConfiguration Where IPEnabled = True")>> "%nb_tmp%"
  echo For Each objNic In objNICs>> "%nb_tmp%"
  echo    errTcpipNetbios = objNic.SetTCPIPNetBIOS(TcpipoverNetbios)>> "%nb_tmp%"
  echo Next>> "%nb_tmp%"
  "%SYSTEMROOT%\SYSTEM32\CSCRIPT.EXE" "%nb_tmp%"
  del /F /Q "%nb_tmp%"
  set REBOOT_REQUIRED=yes

:SKIP_NB_DISABLE
rem Skip Billboard because /all is used
if /I %SELECT%=="/all" goto :SW_ALL
if /I %SELECT%=="/std" goto :SW_ALL
if /I %SELECT%=="/relan" goto :SW_ALL
echo.
echo  ___________________________________________________________________
echo.
echo                   *** Zusammenfassung / Result ***
echo.
echo  Es wurden NICHT alle Aenderungen umgesetzt!
echo  Um alle Vorschlaege von kssysteme.de umzusetzen, verwenden Sie
echo  bitte den Parameter '/all' oder waehlen Sie im Menue den Punkt "3".
if /I %DHCP_CHANGES%=="YES" (
         	echo.
	  	echo  Wichtiger DHCP Hinweis
	  	echo  ======================
	  	echo  Ihre Konfiguration deutete an, das kein DHCP benoetigt wird. Falls
          	echo  Sie jedoch einen DSL-Internetzugang besitzen und DHCP irrtuemlich 
	  	echo  deaktivert wurde, kann es nach einem Neustart zu Problemen mit der 
	  	echo  Internetverbindung kommen. Starten sie zur Problembehebung den 
	  	echo  DHCP-Dienst von Hand neu.
	  	echo.
		)

echo.
echo  Not all changes could be performed. To change all issues listed
echo  on www.ntsvcfg.de please use parameter '/all' or select item "3"!
if /I %DHCP_CHANGES%=="YES" (
         	echo.
	  	echo  Important DHCP Notice
	  	echo  =====================
	  	echo  Your configuration indicates that DHCP will no longer be required.
	  	echo  But if you are using a DSL internet connection this choice probably 
          	echo  might be wrong. If you experiences problems during accessing the 
	  	echo  internet please re-activate the "DHCP Service" manually.
		echo.
		)
echo  ___________________________________________________________________

:SW_ALL

if /I %SELECT%=="/relan" (
        rem startup: auto
        echo.
        echo  ------------------
        echo  Re-enabling services ...
        "%sc%" config LmHosts  start= auto
        "%sc%" config RemoteRegistry start= auto
        "%sc%" config SamSs start= auto
        "%sc%" config Winmgmt start= auto
        if /I "%SYSTEM%"=="2k" (
                "%sc%" config RPCSs start= auto
                "%sc%" config lanmanServer start= auto
                "%sc%" config seclogon start= auto
                )
        if /I "%SYSTEM%"=="XP" (
                rem "%sc%" config SharedAccess start= auto
                )


        rem start re-enabled services
        echo.
        echo  ------------------
        echo  [Re]starting services ...
        echo.

        "%sc%" query RemoteRegistry | "%find%"  /i "1  STOPPED" >NUL
        if not errorlevel 1 "%net%" start RemoteRegistry
        "%sc%" query SamSs | "%find%"  /i "1  STOPPED" >NUL
        if not errorlevel 1 "%net%" start SamSs
        "%sc%" query LmHosts | "%find%"  /i "1  STOPPED" >NUL
        if not errorlevel 1 "%net%" start LmHosts
        "%sc%" query Winmgmt | "%find%"  /i "1  STOPPED" >NUL
        if not errorlevel 1 "%net%" start Winmgmt
        if /I "%SYSTEM%"=="2k" (
                "%sc%" query LanmanServer | "%find%"  /i "1  STOPPED" >NUL
                if not errorlevel 1 "%net%" start lanmanServer
                "%sc%" query RPCSs | "%find%"  /i "1  STOPPED" >NUL
                if not errorlevel 1 "%net%" start RPCSs
                "%sc%" query Seclogon | "%find%"  /i "1  STOPPED" >NUL
                if not errorlevel 1 "%net%" start seclogon
                )

        if /I "%SYSTEM%"=="XP" (
                rem "%net%" start SharedAccess
                )

        rem enable SMB port 445
        echo.
        echo  ------------------
        echo  Enabling SMB port 445 ...
        echo REGEDIT4 > "%SMB_TMP%"
        echo. >> "%SMB_TMP%"
        echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetBT\Parameters] >> "%SMB_TMP%"
        echo "SMBDeviceEnabled"=dword:00000001 >> "%SMB_TMP%"
        echo. >> "%SMB_TMP%"
        echo. >> "%SMB_TMP%"
        "%regedit%" /s "%SMB_TMP%"
        del /F /Q "%SMB_TMP%"
        set REBOOT_REQUIRED=yes
        )


rem Creating fingerprint of current service settings...
if exist "%FPRINT%" del /F /Q "%FPRINT%"
if /I %USE_FPRINT%==YES (
        echo.
        echo  Creating fingerprint which will take a few seconds ...
        "%sc%" query type= service state= all bufsize= 8192 | %FIND% "SERVICE_NAME" > %TEMP%\~svclist.txt
        for /F "tokens=1*" %%a in (%TEMP%\~svclist.txt) do (
                echo %%b >>"%FPRINT%"
                "%sc%" query "%%b" | %FIND% "STATE" >>"%FPRINT%"
                "%sc%" qc "%%b" | %FIND% "DISPLAY_NAME" >>"%FPRINT%"
                "%SC%" qc "%%b" | %FIND% "START_TYPE" >>"%FPRINT%"
                echo. >> "%FPRINT%"
                )
        del "%TEMP%\~svclist.txt"
        echo                                                      ... done.
        )
goto :END


:RESTORE
echo  ____________________________________________________
echo.
echo  Letzte Aenderungen zuruecknehmen [y/n]?
set /P UNDO= Undo last changes [y/n]?
if /I "%UNDO%"=="y" (
        echo  _______________________________________________________________
        echo.
        echo  Hinweis:
        echo  ========
        echo  Moeglicherweise meldet Windows Fehler beim Importieren.
        echo  Ignorieren Sie diese mit Klick auf "OK".
        echo.
        echo  Windows might probably report an error during importing the
        echo  backups. Just ignore this by clicking the "OK" button!
        echo  _______________________________________________________________
        echo  Status:
        echo  -------
        :RESTORE_EXT
        if exist "%SVC_BAK%" (
                echo     Importing services ...
                echo        ["%SVC_BAK%"]
                "%regedit%" /s "%SVC_BAK%"
                set action=""
                )

        if exist "%DCOM_BAK%" (
                echo     Importing DCOM ...
                echo        ["%DCOM_BAK%"]
                "%regedit%" /s "%DCOM_BAK%"
                )

        if exist "%DCOMP_BAK%" (
                echo     Importing DCOM-standard protocols ...
                echo        ["%DCOMP_BAK%"]
                "%regedit%" /s "%DCOMP_BAK%"
                )

        if exist "%SMB_BAK%" (
                echo     Importing SMB-settings ...
                echo        ["%SMB_BAK%"]
        	echo   - Removing SMBDeviceEnabled RegKey ...
		echo REGEDIT4 > "%USERPROFILE%\smbpatch~.reg"
		echo. >> "%USERPROFILE%\smbpatch~.reg"
		echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetBT\Parameters] >> "%USERPROFILE%\smbpatch~.reg"
		echo "SMBDeviceEnabled"=- >> "%USERPROFILE%\smbpatch~.reg"
		echo. >> "%USERPROFILE%\smbpatch~.reg"
		echo. >> "%USERPROFILE%\smbpatch~.reg"
		"%SystemRoot%\regedit.exe" /s "%USERPROFILE%\smbpatch~.reg"
		del /F /Q "%USERPROFILE%\smbpatch~.reg"
                "%regedit%" /s "%SMB_BAK%"
                )

        if exist "%HANDLER1%" (
                echo     Importing URL_HANDLER AIM ...
                echo        ["%HANDLER1%"]
                "%regedit%" /s "%HANDLER1%"
                )

        if exist "%HANDLER2%" (
                echo     Importing URL_HANDLER GOPHER ...
                echo        ["%HANDLER2%"]
                "%regedit%" /s "%HANDLER2%"
                )

        if exist "%HANDLER3%" (
                echo     Importing URL_HANDLER TELNET ...
                echo        ["%HANDLER3%"]
                "%regedit%" /s "%HANDLER3%"
                )

        rem Skipping back to next state
        if /I "%RESTORE%"=="YES" goto :NO_RESTORE

        echo     Removing RPC Internet key ....
        echo REGEDIT4 >"%USERPROFILE%\svc_fix.reg"
        echo. >>"%USERPROFILE%\svc_fix.reg"
        echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Rpc\Internet] >>"%USERPROFILE%\svc_fix.reg"
        echo. >>"%USERPROFILE%\svc_fix.reg"
        echo. >>"%USERPROFILE%\svc_fix.reg"
        "%regedit%" /s "%USERPROFILE%\svc_fix.reg"
        del /F /Q "%USERPROFILE%\svc_fix.reg"

        rem Creating fingerprint of current service settings...
        if exist "%FPRINT%" del /F /Q "%FPRINT%"
        if /I %USE_FPRINT%==YES (
                echo.
                echo  Creating fingerprint which will take a few seconds ...
                "%sc%" query type= service state= all bufsize= 8192 | %FIND% "SERVICE_NAME" > %TEMP%\~svclist.txt
                for /F "tokens=1*" %%a in (%TEMP%\~svclist.txt) do (
                        echo %%b >>"%FPRINT%"
                        "%sc%" query "%%b" | %FIND% "STATE" >>"%FPRINT%"
                        "%sc%" qc "%%b" | %FIND% "DISPLAY_NAME" >>"%FPRINT%"
                        "%SC%" qc "%%b" | %FIND% "START_TYPE" >>"%FPRINT%"
                        echo. >> "%FPRINT%"
                        )
                del "%TEMP%\~svclist.txt"
                echo                                                      ... done.
                )

        echo.
        echo  _______________________________________________________________
        echo.
        echo               *** Zusammenfassung / Result ***
        echo.
        echo  Die Ruecksicherung wurde ausgefuehrt. Wenn in der oberen Zeile
        echo  keine Statusmeldungen zu sehen sind, existierten keine rueckzu-
        echo  sichernden Dateien. Aktivieren Sie gegebenenfalls NetBios in
        echo  den Eigenschaften der jeweiligen Netzwerkkarte.
        echo  Bitte starten Sie abschliessend Ihren Rechner neu.
        echo.
        echo  Restore finished. If you don't see any messages in the status
        echo  box above, there were no files to restore. Please reactivate
        echo  NetBios for each NIC you want use with it and reboot afterwards.
        echo  ________________________________________________________________
        )

goto :END

:RESTORE_DEFAULTS
echo.
echo                     *** Restore Factory Settings ***
echo.
echo  ______________________________________________________________________________
echo.
echo  Einstellungen vor Erstanwendung des Scripts wiederherstellen (ausser NetBIOS)?
set /P UNDO= Restore defaults (before using script, except NetBIOS) [y/n]?
if /I "%UNDO%"=="y" (
        echo.
        echo   - Restoring original service settings [if exists] ...

        if exist "%SVC_BAK%.default" 	(
					echo      "%SVC_BAK%.default"
					"%regedit%" /s "%SVC_BAK%.default"
					)
        if exist "%DCOM_BAK%.default" 	(
					echo      "%DCOM_BAK%.default"
					"%regedit%" /s "%DCOM_BAK%.default"
					)
        if exist "%DCOMP_BAK%.default" 	(
					echo      "%DCOMP_BAK%.default"
					"%regedit%" /s "%DCOMP_BAK%.default"
					)
        if exist "%SMB_BAK%.default"	(
					echo      "%SMB_BAK%.default"
        				echo   - Removing SMBDeviceEnabled RegKey ...
					echo REGEDIT4 > "%USERPROFILE%\smbpatch~.reg"
					echo. >> "%USERPROFILE%\smbpatch~.reg"
					echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetBT\Parameters] >> "%USERPROFILE%\smbpatch~.reg"
					echo "SMBDeviceEnabled"=- >> "%USERPROFILE%\smbpatch~.reg"
					echo. >> "%USERPROFILE%\smbpatch~.reg"
					echo. >> "%USERPROFILE%\smbpatch~.reg"
					"%SystemRoot%\regedit.exe" /s "%USERPROFILE%\smbpatch~.reg"
					del /F /Q "%USERPROFILE%\smbpatch~.reg"
					"%regedit%" /s "%SMB_BAK%.default"
					)
        if exist "%HANDLER1%.default" 	(
					echo      "%HANDLER1%.default"
					"%regedit%" /s "%HANDLER1%.default"
					)
        if exist "%HANDLER2%.default" 	(
					echo 	  "%HANDLER2%.default"
					"%regedit%" /s "%HANDLER2%.default"
					)
        if exist "%HANDLER3%.default" 	(
					echo "%HANDLER3%.default"
					"%regedit%" /s "%HANDLER3%.default"
					)
        echo                                                 ... done.

        echo   - Removing RPC Internet key ...
        echo REGEDIT4 >"%USERPROFILE%\svc_fix.reg"
        echo. >>"%USERPROFILE%\svc_fix.reg"
        echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Rpc\Internet] >>"%USERPROFILE%\svc_fix.reg"
        echo. >>"%USERPROFILE%\svc_fix.reg"
        echo. >>"%USERPROFILE%\svc_fix.reg"
        "%regedit%" /s "%USERPROFILE%\svc_fix.reg"
        del /F /Q "%USERPROFILE%\svc_fix.reg"
        echo                                                 ... done.

        )
goto :QUIT


:SC_DOWNLOAD
echo  ______________________________________________________________
echo.
echo  Besteht eine aktive Internetverbindung?
echo  Are you currently connected to the internet?
echo.
set /P UNDO= Bitte waehlen/Please choose: [y/n]?
  if /I "%UNDO%"=="y" goto :SC_DOWNLOAD_OK
goto :END

:SC_DOWNLOAD_OK
if exist "%SYSTEMROOT%\sc.zip" goto :SCE
echo  Generating FTP-script ...
if exist "%USERPROFILE%"\script_sc.ls del /F "%USERPROFILE%\script_sc.ls"
echo open 207.46.133.140 >"%USERPROFILE%\script_sc.ls"
echo user anonymous anonymous@aol.com >>"%USERPROFILE%\script_sc.ls"
echo type binary >>"%USERPROFILE%\script_sc.ls"
echo user anonymous anonymous@aol.com >>"%USERPROFILE%\script_sc.ls"
echo type binary >>"%USERPROFILE%\script_sc.ls"
echo get /reskit/win2000/sc.zip "%SYSTEMROOT%\System32\SC.ZIP" >>"%USERPROFILE%\script_sc.ls"
echo quit >>"%USERPROFILE%\script_sc.ls"

echo  Downloading SC.EXE ...
ftp -s:"%USERPROFILE%\script_sc.ls"
del /F "%USERPROFILE%\script_sc.ls"

:SCE
if exist "%SYSTEMROOT%\System32\pkunzip.exe" goto :PKE
echo  Generating FTP-script ...
if exist "%USERPROFILE%"\script_pk.ls del /F "%USERPROFILE%\script_pk.ls"
echo open ftp.uni-duesseldorf.de >"%USERPROFILE%\script_pk.ls"
echo user anonymous anonymous@aol.com >>"%USERPROFILE%\script_pk.ls"
echo type binary >>"%USERPROFILE%\script_pk.ls"
echo user anonymous anonymous@aol.com >>"%USERPROFILE%\script_pk.ls"
echo type binary >>"%USERPROFILE%\script_pk.ls"
echo get /pub/ie/pkunzip.exe "%SYSTEMROOT%\System32\pkunzip.exe" >>"%USERPROFILE%\script_pk.ls"
echo quit >>"%USERPROFILE%\script_pk.ls"

echo  Downloading PKUNZIP.EXE ...
ftp -s:"%USERPROFILE%\script_pk.ls"
del /F "%USERPROFILE%\script_pk.ls"

:PKE
if not exist "%SYSTEMROOT%\System32\sc.zip" (
        echo.
        echo   Download fehlgeschlagen. Bitte laden sie sich die Datei SC.ZIP manuell
        echo   herunter und kopieren diese nach %SYSTEMROOT%\.
        echo.
        echo   Downloading SC.ZIP failed. Please download it manually an copy it to
        echo   %SYSTEMROOT%\.
        )

if not exist "%SYSTEMROOT%\System32\pkunzip.exe" (
        echo.
        echo   Die Datei PKUNZIP.EXE konnte nicht gefunden werden. Diese wird zum
        echo   Entpacken des Archivs SC.ZIP benoetigt!
        echo.
        echo   File PKUNZIP.EXE not found. It is needed to decompress the archive SC.EXE.
        )

if exist "%SYSTEMROOT%\System32\SC.ZIP" (
        if exist "%SYSTEMROOT%\System32\pkunzip.exe" (
                "%SYSTEMROOT%\System32\pkunzip.exe" -e "%SYSTEMROOT%\System32\sc.zip" sc.exe
                )
        )

move /Y sc.exe "%SYSTEMROOT%\System32\"
echo.
echo  Skript wird neu gestartet ...
echo  Restarting script ...
goto :START

:FIX
echo.
echo                     -= svc2kxp.cmd taskplaner fix =-
echo.
echo.
echo  Druecken Sie "Y", um das Problem mit dem Taskplaner ("falscher Parameter")
echo  unter Windows XP zu beheben.
echo.
echo  Press "Y", if you want fix issue "scheduler doesn't start under Windows XP
echo  after running script v2.0 - v2.1build0".
echo.
set /P UNDO= Fix problem [y/n]?
if /I "%UNDO%"=="y" (
        echo REGEDIT4 >"%USERPROFILE%\svc_fix.reg"
        echo. >>"%USERPROFILE%\svc_fix.reg"
        echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Rpc\Internet] >>"%USERPROFILE%\svc_fix.reg"
        echo. >>"%USERPROFILE%\svc_fix.reg"
        echo. >>"%USERPROFILE%\svc_fix.reg"
        "%regedit%" /s "%USERPROFILE%\svc_fix.reg"
        del /F /Q "%USERPROFILE%\svc_fix.reg"
        echo  ______________________________________
        echo  OK. Bitte starten Sie den Rechner neu und kontrollieren Sie erneut,
        echo  ob hierdurch Ports geoeffnet wurden.
        echo.
        echo  Done. Please reboot and check again for open ports ...!
        )


rem Creating fingerprint of current service settings...
if exist "%FPRINT%" del /F /Q "%FPRINT%"
goto quit
if /I %USE_FPRINT%==YES (
        echo.
          echo  Creating fingerprint which will take a few seconds ...
          "%sc%" query type= service state= all bufsize= 8192 | %FIND% "SERVICE_NAME" > %TEMP%\~svclist.txt
          for /F "tokens=1*" %%a in (%TEMP%\~svclist.txt) do (
                echo %%b >>"%FPRINT%"
                "%sc%" query "%%b" | %FIND% "STATE" >>"%FPRINT%"
                "%sc%" qc "%%b" | %FIND% "DISPLAY_NAME" >>"%FPRINT%"
                "%SC%" qc "%%b" | %FIND% "START_TYPE" >>"%FPRINT%"
                echo. >> "%FPRINT%"
                )
        del "%TEMP%\~svclist.txt"
        echo                                                      ... done.
        )

goto :QUIT

rem **** Additional Feature List ****

:MORE_OPTIONS
cls
echo  ______________________________________________________________________________
echo.
echo                 *** Weitere Optionen / More Options Menue ***
echo                     =====================================
echo.
if /I "%SVC_MOD%"=="YES" (
        echo  [E]...Zeigt eine Liste an, welche Dienste seit der letzten Anwendung
        echo        von svc2kxp.cmd veraendert wurden.
        echo.
        echo        Shows a list with modified services since last use of scv2kxp.cmd
        echo.
        )

echo  [G]...Generiert einen neuen Fingerprint, um Veraenderungen bei
echo        Diensten zu erfassen
echo.
echo        Generates a new fingerprint to correctly detect changes of
echo        services
echo.
echo  [S]...Sichern der aktuellen Dienstekonfiguration.
echo        Saving current NT service configuration (auto/demand/disabled).
echo.
echo  ______________________________________________________________________________
echo.
if /I "%SVC_MOD%"=="NO" set /P CHS=       Bitte waehlen Sie/Please choose: [G], [S], [B]ack or [Q]uit?
if /I "%SVC_MOD%"=="YES" set /P CHS=       Bitte waehlen Sie/Please choose: [E], [G], [S], [B]ack or [Q]uit?
if /I "%SVC_MOD%"=="YES" if /I "%CHS%"=="E" GOTO :EVALUATE_SERVICES
if /I "%CHS%"=="G" GOTO :CREATING_NEW_FINGERPRINT
if /I "%CHS%"=="B" (
                    CLS
                    GOTO :START
                   )
if /I "%CHS%"=="S" GOTO :SAVE_SVC_SETTINGS
if /I "%CHS%"=="Q" GOTO :QUIT
GOTO :MORE_OPTIONS



:EVALUATE_SERVICES
cls
echo  ______________________________________________________________________________
echo.
echo                        *** Evaluate Services Menue ***
echo.
"%FC%" /N "%FPRINT%" "%USERPROFILE%\ntsvcfg\svc2cmp.sav"
echo  ______________________________________________________________________________
echo.
set /P CHS=       Bitte waehlen Sie/Please choose: [B]ack, [U]pdate or [Q]uit?
if /I "%CHS%"=="B" GOTO :MORE_OPTIONS
if /I "%CHS%"=="U" GOTO :CREATING_NEW_FINGERPRINT
if /I "%CHS%"=="Q" GOTO :QUIT
GOTO :MORE_OPTIONS


:SAVE_SVC_SETTINGS
cls
echo  ______________________________________________________________________________
echo.
echo               *** Manage current services configurations menue ***
echo                   --------------------------------------------
echo.
echo   Soll die aktuelle Dienstekonfiguration gesichert werden?
echo.
set /P CHS=  Should the current service configuration saved (y/n)?
if /I "%CHS%"=="N" GOTO :MORE_OPTIONS
if /I "%CHS%"=="Y" (
        echo   Saving current services settings to:
        echo.
        echo    - %SVC_SAV%
        "%regedit%" /e "%SVC_SAV%" HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services
        echo.
        echo   ... Done!
        echo  ______________________________________________________________________________
        echo.
        echo        Beliebige Taste druecken, um fortzufahren. Hit any key to return.
        pause>NUL
        )
if /I "%CHS%"=="Q" GOTO :QUIT
goto :MORE_OPTIONS




pause >NUL
goto :MORE_OPTIONS


:CREATING_NEW_FINGERPRINT
cls
echo  ______________________________________________________________________________
echo.
echo                     *** Creating new fingerprint menue ***
echo                         ------------------------------
echo.
set /P CHS=  Create new fingerprint [Y/N]?
if /I "%CHS%"=="Y" (
        if exist "%FPRINT%" del /F /Q "%FPRINT%"
        echo   Creating new fingerprint which will take a few seconds ...
        "%sc%" query type= service state= all bufsize= 8192 | %FIND% "SERVICE_NAME" > %TEMP%\~svclist.txt
        for /F "tokens=1*" %%a in (%TEMP%\~svclist.txt) do (
                echo %%b >>"%FPRINT%"
                "%sc%" query "%%b" | %FIND% "STATE" >>"%FPRINT%"
                "%sc%" qc "%%b" | %FIND% "DISPLAY_NAME" >>"%FPRINT%"
                "%SC%" qc "%%b" | %FIND% "START_TYPE" >>"%FPRINT%"
                echo. >> "%FPRINT%"
                )
        del "%TEMP%\~svclist.txt"
        echo                                                           ... done.
        echo  ______________________________________________________________________________
        echo.
        echo                          [Press any key to continue]
        set CHK_SVC=YES
        PAUSE >NUL
        )
cls
GOTO :MORE_OPTIONS


:XPSYSRESTORE
REM Creating A System Restore Point // Source Code: MS Technet Scriptcenter
        echo.
        echo  # Creating System Restore Point [if XP SysRestore is enabled] ...
        if exist "%srctmp%" del /F /Q "%srctmp%"
        echo CONST DEVICE_DRIVER_INSTALL = 10 >"%srctmp%"
        echo CONST BEGIN_SYSTEM_CHANGE = 100 >>"%srctmp%"
        echo.>>"%srctmp%"
        echo strComputer = ".">>"%srctmp%"
        echo Set objWMIService = GetObject("winmgmts:" _ >>"%srctmp%"
        echo         ^& "{impersonationLevel=impersonate}!\\" ^& strComputer ^& "\root\default")>>"%srctmp%"
        echo.>>"%srctmp%"
        echo Set objItem = objWMIService.Get("SystemRestore")>>"%srctmp%"
        echo errResults = objItem.CreateRestorePoint _ >>"%srctmp%"
        echo         ("svc2kxp.cmd created restore point", DEVICE_DRIVER_INSTALL, BEGIN_SYSTEM_CHANGE)>>"%srctmp%"
        "%srctmp%"
        del /F /Q "%srctmp%"
        echo.
goto :XPSYSRESTORE_DONE


:END
if "%REBOOT_REQUIRED%"=="yes" (
        echo.
        echo  ______________________________________________________
        echo.
        echo           *** Zusammenfassung / Result ***
        echo.
        if /I %SELECT%=="/all" echo  Es wurden alle gewuenschten Aenderungen durchgefuehrt.
        if /I %SELECT%=="/std" echo  Einige Dienste blieben unveraendert.
        if /I %SELECT%=="/relan" echo  Notwendige LAN-Einstellungen wurden aktiviert.
	if /I %DHCP_CHANGES%=="YES" (
         	echo.
	  	echo  Wichtiger DHCP Hinweis
	  	echo  ======================
	  	echo  Ihre Konfiguration deutete an, das kein DHCP benoetigt wird. Falls
          	echo  Sie jedoch einen DSL-Internetzugang besitzen und DHCP irrtuemlich 
	  	echo  deaktivert wurde, kann es nach einem Neustart zu Problemen mit der 
	  	echo  Internetverbindung kommen. Starten sie zur Problembehebung den 
	  	echo  DHCP-Dienst von Hand neu.
	  	echo.
		)
	echo.
        echo  Bitte starten Sie abschliessend Ihren Rechner neu.
        echo.
        if /I %SELECT%=="/all" echo  All changes applied successfully.
        if /I %SELECT%=="/std" echo  Some services stay unchanged.
        if /I %SELECT%=="/relan" echo  LAN settings reactivated.
	if /I %DHCP_CHANGES%=="YES" (
         	echo.
	  	echo  Important DHCP Notice
	  	echo  =====================
	  	echo  Your configuration indicates that DHCP will no longer be required.
	  	echo  But if you are using a DSL internet connection this choice probably 
          	echo  might be wrong. If you experiences problems during accessing the 
	  	echo  internet please re-activate the "DHCP Service" manually.
		echo.
		)
        echo  Please reboot.
        echo  ______________________________________________________
        )


:QUIT
echo            ________________________________________________________
echo.
echo                 Weitere Informationen: http://www.ntsvcfg.de
echo            For more informations: http://www.ntsvcfg.de/ntsvcfg_eng
echo            ________________________________________________________
echo             [Taste zum Beenden druecken]   [Press any key to quit]
echo             ------------------------------------------------------
echo.
if /I "%1"=="" pause>NUL

:QUIT_EXT
endlocal
if exist "%USERPROFILE%\ntsvcfg\svc2cmp.sav" del /F /Q "%USERPROFILE%\ntsvcfg\svc2cmp.sav"
echo.
