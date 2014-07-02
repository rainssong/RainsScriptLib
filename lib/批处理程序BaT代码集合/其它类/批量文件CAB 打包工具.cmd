@ECHO OFF
SET TT=老毛桃制作的批量文件 CAB 打包工具
COLOR 1F
TITLE %TT%
SET ERR=
SET C0=MAKECAB /D CompressionType=LZX /D CompressionMemory=21 /D MaxDiskSize=CDROM /D Cabinet=ON /D Compress=ON /D FolderSizeThreshold=5000000

:BEGIN
CLS
ECHO.
ECHO 　　　　　　　╭══════════════════╮
ECHO 　　　　　　　║　　　　　　　　　　　　　　　　　　║
ECHO 　　　╭═══┤ 老毛桃制作的批量文件 CAB 打包工具! ├═══╮
ECHO 　　　║　　　║　　　　　　　　　　　　　　　　　　║　　　║
ECHO 　　　║　　　╰══════════════════╯　　　║
ECHO 　　　║　　　　　　　　　　　　　　　　　　　　　　　　　　║
ECHO 　　　║　　 您是需要将批量文件制作成一个压缩包呢？　　　　 ║
ECHO 　　　║　　 还是想生成 N 个 CAB 格式的单独压缩文件？　　　 ║
ECHO 　　　║　　　　　　　　　　　　　　　　　　　　　　　　　　║
ECHO 　　　║　　　 [1] 将批量文件制作成一个压缩包　　　　　　　 ║
ECHO 　　　║　　　 [2] 将每个文件制作成单独压缩文件　　　　　　 ║
ECHO 　　　║　　　 [3] 将单个文件制作成单独压缩文件　　　　　　 ║
ECHO 　　　║　　　 [Q] 退出　　　　　　　　　　　　　　　　　　 ║
ECHO 　　　║　　　　　　　　　　　　　　　　　　　　　　　　　　║
ECHO 　　　╟──────────────────────────╢
ECHO 　　　║ 注：1. 待压缩文件的父目录需与本程序在同一路径下；　║
ECHO 　　　║　　 2. 待压缩文件所在路径(包括父路径)不许有空格。　║
ECHO 　　　╟══════════════════════════╢
ECHO 　　　║　版权所有：老毛桃　　　供无忧朋友们交流，翻版不究　║
ECHO 　　　╰──────────────────────────╯
ECHO.
SET Choice=
SET /P Choice=　　　　请选择要进行的操作（1/2/3/Q），然后按回车：

IF NOT '%Choice%'=='' SET Choice=%Choice:~0,1%
IF /I '%Choice%'=='1' GOTO LOOPA
IF /I '%Choice%'=='2' GOTO LOOPA
IF /I '%Choice%'=='3' GOTO LOOPD
IF /I '%Choice%'=='Q' EXIT
GOTO BEGIN

:LOOPA
IF /I '%Choice%'=='1' (
TITLE %TT% - 制作成一个压缩包
)
IF /I '%Choice%'=='2' (
TITLE %TT% - 制作成多个单独压缩文件
)
IF "%Err%"=="" (
CLS
)
ECHO 请输入需压缩的文件所在的目录名，如 Files
SET Ds=
SET /P Ds=
IF "%Ds%"=="" goto LOOPA
IF NOT EXIST %Ds% (
SET Err=1
ECHO.
CLS
ECHO 您所输入的路径不存在，请重新输入
ECHO.
GOTO LOOPA
)

IF /I '%Choice%'=='1' GOTO LOOPB
GOTO LOOPC

:LOOPB
CLS
ECHO 请输入需要保存的压缩包文件名，如 Drive.CAB
SET FCab=
SET /P FCab=
IF "%FCab%"=="" goto LOOPB
SET C=%C0% /D DiskDirectoryTemplate=.\ /D CabinetNameTemplate=%FCab%
SET TF=%TEMP%\Files.tmp
IF EXIST %TF% DEL %TF% >NUL
FOR /F %%i in ('dir /b %Ds%') do ECHO %Ds%\%%i >>%TF%
ECHO.
%C% /F %TF%
DEL /F /S /Q %TF% SETUP.INF SETUP.RPT >NUL
GOTO EXIT

:LOOPC
CLS
ECHO 请输入需要保存的 CAB 格式文件所在路径，比如 OutFile
ECHO 如果此路径不存在，将在当前目录下自动创建。
SET OUT=
SET /P OUT=
IF "%OUT%"=="" GOTO LOOPC
FOR /F %%I IN ('CD') DO SET P=%%I\%Ds%
SET C=%C0% /L %OUT% %P%\
ECHO.
FOR /F %%I IN ('dir /B %Ds%') do %C%%%I
GOTO EXIT

:LOOPD
TITLE %TT% - 只压缩一个文件
IF "%Err%"=="" (
CLS
)
ECHO 请输入需要需要压缩的文件所在路径，比如 Driver\NV4_Disp.SYS
ECHO 其中 Driver 与本程序在同一文件夹中
ECHO 您也可以选择按 TAB 键快速输入路径和文件名称，完成后按回车确认
SET FileR=
SET /P FileR=
IF "%FileR%"=="" (
CLS
GOTO LOOPD
)
IF NOT EXIST "%FileR%" (
SET Err=1
ECHO.
CLS
ECHO 您所输入的文件路径不存在，请重新输入
ECHO.
GOTO LOOPD
)
GOTO LOOPE

:LOOPE
CLS
ECHO 请输入需要需要保存的压缩文件路径，比如 Driver\NV4_Disp.CAB
ECHO 如果不输入文件路径，则以 NV4_Disp.SY_ 的形式保存在本程序所在路径
ECHO.
ECHO 注意：如果尝试输入一个不存在的路径信息，压缩程序会出错！
SET FileT=
SET /P FileT=
%C0% %FileR% %FileT%
GOTO EXIT

:EXIT
ECHO.
ECHO.
ECHO.
ECHO 您需要的操作已经全部完成，请核查. . .
ECHO.
ECHO 老毛桃感谢您的使用，如果您有什么好的建议，请 QQ 我！
ECHO.
ECHO.
ECHO 请按任意键退出程序. . .
PAUSE >NUL