@echo off
:: 把从QQ中复制下来的内容准确还原，但是字符串不能太长
:: 先把复制下来的内容保存为 tmp.txt，然后生成test.txt，test.txt就是还原后的内容
:: Code by JM 2007-3-9 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=28315

more tmp.txt>test.txt
start test.txt