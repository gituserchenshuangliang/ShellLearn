#!/bin/bash
:<<!
# PART ONE #
# print out
echo 'Hello world !'
# variable
var='a variable one'
var2='a variable two'
var3='a variable three'
# variable use
echo $var
# char of length
echo ${#var}
for i in A B C; do
	echo print${i}
done
# readonly varibale
readonly var
var=2123
echo $var
# delete variable
unset var2
echo delete $var2
# substring(begin:length)
echo ${var3:2:8}
# array
array_var=(12 34 56 78 90)
echo array:${array_var[1]}
# array length
echo length:${#array_var[*]}

# PART TWO #
# transmit param
:<<!
echo param-0:$0
echo param-1:$1
echo param num:$#
echo all param:$*
echo all param:$@
echo PID:$$

echo "-- \$* demo ---"
for i in "$*"; do
    echo $i
done
echo "-- \$@ demo---"
for i in "$@"; do
    echo $i
done
# arithmetic echo a*b:`expr $a \* $b`
a=24
b=2
# logic -eq -gl -lt -ge -le ! -o -a && ||
if [ $a > $b ]
then
	echo a:$a
fi

if [ $a != $b ]
then
	echo True
fi
if [ $c == 1 -a $a == $b ]
then
	echo True
else
	echo False
fi
# -z:字符长0--true，-n：字符长0--false
d=abcd
if [ -z $d ]
then
	echo True
else
	echo False
fi  

# file arithmetic -b:设备文件 -d:是否目录 -f:是否普通文件 -x -r -w -e
e=/usr/program
f=~/ShellLearn/base.sh
j=~/ShellLearn/xbase.sh
if [ -d $e ]
then
	echo 是目录
else
	echo 非目录
fi
if [ -f $f ]
then
	echo 是文件
else
	echo 非文件
fi
if [ -e $j ]
then
	echo 存在
else
	echo 不存在
fi

# PART THREE #
# recive variable
# read -p:提示  -n:限制长度  -t:时间  -s：隐藏 password 
read -p '输入：'  param
echo recived: $param
# -e 开启转义 \n:换行 \c:不换行
echo -e "OK! \nchen" 
echo `date`

# printf %-10s:%s占位符 -10宽度
printf "%-10s %-8s %-4s\n" 姓名 性别 体重kg  

# test order test 命令用于检查某个条件是否成立，它可以进行数值、字符和文件三个方面的测试。
cd /bin
if test -e ./bash
then
    echo '文件已存在!'
else
    echo '文件不存在!'
fi
a=23
b=32
c=$[a+b]
echo $c

# Shell 流程控制 
# if else then elif
if [ $(ps -ef | grep -c "ssh") -gt 1 ]; then echo "true"; fi
a=10
b=20
if [ $a == $b ]; then echo "a 等于 b"; elif [ $a -gt $b ];then echo "a 大于 b"; else echo "没有符合的条件"; fi
# for in
for i in 23 34 ;do echo $i;done
# while untill与while相反为false时循环
a=1
# while (($a < 4));do echo A;let a++ ;done
# while read a ; do echo $a ; done
# case选择
while true
do
echo '输入ABCD:'
	read aNum
	case $aNum in
	    A)  echo '你选择了 1'
	    ;;
	    B)  continue
	    ;;
	    C)  echo '你选择了 3'
	    ;;
	    D)  echo '你选择了 4'
	    ;;
	    *)  echo '你没有输入 A 到 D 之间的'; break
	    ;;
	esac
done

# PART FOUR #
# Function
function add(){
	return $(($1 + $2))
}
add 23 1
echo $?
!
#PART FIVE
#命令 	说明
# command > file 	将输出重定向到 file。
#command < file 	将输入重定向到 file。
#command >> file 	将输出以追加的方式重定向到 file。
#n > file 	将文件描述符为 n 的文件重定向到 file。
#n >> file 	将文件描述符为 n 的文件以追加的方式重定向到 file。
#n >& m 	将输出文件 m 和 n 合并。
#n <& m 	将输入文件 m 和 n 合并。
#<< tag 	将开始标记 tag 和结束标记 tag 之间的内容作为输入。
# 需要注意的是文件描述符 0 通常是标准输入（STDIN），1 是标准输出（STDOUT），2 是标准错误输出（STDERR）。
yum search all > a.txt
#导入文件. filename   # 注意点号(.)和文件名中间有一空格或source filename
. ./chen.sh


