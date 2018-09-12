#!/bin/bash
echo 启动VNC服务....
vncserver
echo 服务已开启。
while true
do
	read -p '输入c关闭服务：'  close
	case $close in
		c)
			vncserver -kill :1
			break;
		;;
		*)
			continue;
		;;
	esac
done
echo 服务已关闭。



