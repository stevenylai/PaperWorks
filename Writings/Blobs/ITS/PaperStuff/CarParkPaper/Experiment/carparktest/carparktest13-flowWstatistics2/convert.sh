#!/bin/sh
cat ${1}|grep "Sensor: "|grep -v problem|sed 's/[a-zA-Z]\{1,\}: //g'|sed 's/\. /|/g'|awk -F'|' '{hour=substr($5,13,1);\
min=substr($5,15,2);\
sec=substr($5,18,2);\
printf("%s|%d\n", $0,hour*3600+min*60+sec);}'
