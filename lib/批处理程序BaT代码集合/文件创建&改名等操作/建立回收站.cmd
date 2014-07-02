@echo off
:: 建立回收站
:: Recycle位置可以随意放置，名字也可随便取
:: 如果在某个分区里建了多个带回收站功能的文件夹，那么它们指向的都是同一个位置
md %drv%:\Recycle>nul 2>nul
attrib +s +h %drv%:\Recycle>nul 2>nul
(echo [.ShellClassInfo]
echo CLSID={645FF040-5081-101B-9F08-00AA002F954E})>C:\tmp
copy c:\tmp %drv%:\Recycle\desktop.ini>nul 2>nul
del c:\tmp>nul 2>nul
attrib +s +h %drv%:\Recycle\desktop.ini