@rem 此BAT文件名一定不能是"tree.bat",否则tree命令会实效,不知道为什么
@rem 可能是因为系统目录有"tree.com",系统会混淆吧.
@rem 用"dir.bat"作文件名却可以.
@echo off
rem 在当前目录生成很漂亮的结构树
tree /f > 1.TXT

rem 象DIR命令一样,不过每个下级目录文件也列出
DIR /S > 2.txt

rem 简洁地列出目录当前目录文件
DIR /d > 3.txt