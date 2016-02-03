#!/bin/bash
cat playat.txt|while read line
do
        sec=` echo "$line/1000"|bc`
        min=`echo "$sec/60"|bc`
        result=""
		#shell中的if 判断，if关键字和[]之间有空格,[]中的判断条件之间也有空格，否则会有语法错
        if [ $min -gt 60 ]
        then
            hour=`echo "$min/60"|bc`
            _min=`echo "$min-$hour*60"|bc`
            _sec=`echo "$sec-$hour*3600-$_min*60"|bc`
            result="0$hour:$_min:$_sec"
            echo $result
        elif [ $min -gt 0 ]
        then
            sec2=`echo "$sec-$min*60"|bc`
            result2="00:$min:$sec2"
            echo $result2
        else
            result3="00:00:$sec"
            echo $result3
        fi
done
