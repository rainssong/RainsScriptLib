cd..

set APP_XML=META-INF\AIR\application.xml

for /f "tokens=2 delims=>" %%i in ('findstr "<id>" %APP_XML%') do (
	for /f "delims=<" %%i in ("%%i")do (
		set APP_ID=%%i
	)
)

explorer %HOMEDRIVE%%HOMEPATH%\AppData\Roaming\%APP_ID%\Local Store