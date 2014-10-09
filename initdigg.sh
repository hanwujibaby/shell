#!/bin/bash
#upArray=(5 6 7 8)
#downArray=(1 2 3 4 5)

file=$1
upFrom=5
upTo=8

plusFrom=1
plusTo=10

downFrom=1
downTo=5


i=1
cat $file | while read line
do
	mFactor=`echo $RANDOM`
	mFactor=$[ $upFrom + $mFactor % ($upTo+1-$upFrom)]

	plusFactor=`echo $RANDOM`
	plusFactor=$[ $plusFrom + $plusFactor % ($plusTo+1-$plusFrom)]

	downFactor=`echo $RANDOM`
	downFactor=$[ $downFrom + $downFactor % ($downTo+1-$downFrom)]

	replyCount=`echo $line|awk '{print $4}'|tr -d '\r'`
	upCount=$[$replyCount*$mFactor+$plusFactor]
	#downCount=$[$replyCount/10+$plusFacor]
	pFactor=`echo $RANDOM`
	pFactor=$[ $plusFrom + $pFactor % ($plusTo+1-$plusFrom)]


	dCount=$[$replyCount/10]
	let downCount=$dCount+$pFactor
	
#	downCount=`expr $dCount + $plusFacor`
	i=$[$i+1]
	echo "$i">>$file.result

	vid=`echo $line|awk '{print $3}'|tr -d '\r'`
	pid=`echo $line|awk '{print $2}'|tr -d '\r'`
	cid=`echo $line|awk '{print $1}'|tr -d '\r'`
	url="someurl?vid=$vid&type=$cid&pid=$pid&upCount=$upCount&downCount=$downCount&callback=initDigg"
	echo $url
	echo $i
	curl "$url"
	
done


echo "finished initing digg data"
