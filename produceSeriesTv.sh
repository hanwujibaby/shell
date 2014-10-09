#!/bin/sh
pids=`cat pid.txt`

for pid in $pids
do
	cat tvseries.txt|awk -v ppid=$pid '{if($2==ppid){upSum+=$3;downSum+=$4;}};END{print ppid" "upSum" "downSum}'
done

echo "done!"

