#!/bin/bash

ps aux | grep $1 

echo 'do you want to kill '$1 '?'

#获取用户输入结果
read -n1 -p "Are you sure? [Y/n] " response
case $response in [yY][eE][sS]|[yY]|[jJ]|'') 
	ps aux | grep $1|awk '{print $2}'|xargs kill -9 
	;;
*)
	echo
	echo canceled
	echo
	;;
esac

