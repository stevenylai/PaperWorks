#!/bin/awk -f
{hour=substr($4,1,1);\
min=substr($4,3,2);\
sec=substr($4,6,2);\
printf("else if [ ${1} -eq %d ];then\n\tSTART=%d\n", $1,hour*3600+min*60+sec);}
