#!/bin/bash
# author --- Cherry.Chen
# date --- 2018-9-12
a=1.从远程主机复制文件。
b=2.从远程主机复制文件夹。
c=3.上传文件到远程主机。
d=4.上传文件夹到远程主机。
e=5.退出。
while true
do
printf "%-20s%-20s%-20s%-20s\n%s\n" $a $b $c $d $e
	read -p "选择需求编号：" choice
	case $choice in
		1)	
			read -p "输入远程主机文件路径："  from
			read -p "文件复制目的地："  to
			scp -P 2222  root@192.168.0.100:$from $to
			read -p "继续y/n？"  anser
			if [ $anser == "y" ]
			then
				continue;
			else
				break;
			fi
		;;
		2)
			read -p "输入远程主机文件夹路径："  from
			read -p "文件复制目的地："  to
			scp -r -P 2222 root@192.168.0.100:$from $to
			read -p "继续y/n？"  anser
			if [ $anser == "y" ]
			then
				continue;
			else
				break;
			fi
		;;
		3)
			read -p "上传文件路径："  from
			read -p "文件复制目的地："  to
			scp -P 2222 $from root@192.168.0.100:$to
			read -p "继续y/n？"  anser
			if [ $anser == "y" ]
			then
				continue;
			else
				break;
			fi
		;;
		4)
			read -p "上传文件夹路径："  from
			read -p "文件夹复制目的地："  to
			scp -r -P 2222 $from root@192.168.0.100:$to
			read -p "继续y/n？"  anser
			if [ $anser == "y" ]
			then
				continue;
			else
				break;
			fi
		;;
		*)
			continue;
		;;
	esac
done
echo Exited.
