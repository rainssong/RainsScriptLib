@echo off
:: 变量的多级嵌套
:: code by  tao0610 2006-11-21
setlocal enabledelayedexpansion
set num=iamyxj
set a=12345
set b=0
set /a b+=1
call echo %%num:~!a:~%b%,1!,1%% 
echo %num:~1,1%
pause 

echo %num:~1,1%
pause
goto :eof


@echo off
:: code by redtek 2006-11-21
cls

set num=Redtek 2006 bbs.cn-dos.net
set a=12345
set b=654321

echo ●　变量测试：
echo.
echo ●　想取 ^%num:~5,1^% ，即：从偏移量5开始取变量num的值，取1个字符，结果：k 
echo 　　根据上面原理，在不使用延时变量的情况下测试变量嵌套变量取值。
echo.
echo ●　现在我们设^%num:~5,1^%这里面的~5要求间接来自另一个变量b。
echo 　　所以，^%num:~5,1^%应（伪代码）表示为：^%num:~b,1^%，但变量b内有多个值，
echo 　　我们只想取变量b内的从偏移量0起的第1个元素，就是5。已经开始嵌套变量了。
echo 　　所以我们还要在num的变量取值计算语句中再嵌套进取变量b（^%b:~1,1^%）的语句。
echo.
echo 　　即：取变量num中的某个字符要由另一个变量b来决定从哪里开始取。
echo 　　　　但是，我们还要让它再嵌套变量，即：
echo 　　　　决定取num变量中的哪一个字符由变量b中某个字符值决定，所以还要再分解b，
echo 　　　　这样，就是三层嵌套变量的关系，它们层层相互影响并嵌套变量着，哈哈……
echo.
echo ●　所以，我们使用了多级测试显示取值的整个过程的演化～：）
echo.
echo 　　下面结果是四条“渐近”求值的过程，最后连Call了3次才求出这些被嵌套的变量：）
echo.

echo 　　%%%%%%%%num:~%%%%b:~%a:~0,1%,1%%%%,1%%%%%%%%

call echo 　　%%%%%%%%num:~%%%%b:~%a:~0,1%,1%%%%,1%%%%%%%%

call call echo 　　%%%%%%%%num:~%%%%b:~%a:~0,1%,1%%%%,1%%%%%%%%

call call call echo 　　最后值为：%%%%%%%%num:~%%%%b:~%a:~0,1%,1%%%%,1%%%%%%%%


rem  理论上，我们可以Call它ｎ多次，这样我们可以随便在变量中再嵌套变量：）
rem  以上是一个对嵌套变量实现更深了解的“晕晕”的实验过程～：）
pause

