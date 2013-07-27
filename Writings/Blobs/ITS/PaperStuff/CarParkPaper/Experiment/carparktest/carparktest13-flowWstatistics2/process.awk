#!/bin/awk -f
{hour=substr($2,1,1);\
min=substr($2,3,2);\
sec=substr($2,6,2);\
printf("else if [ ${1} -eq %d ];then\n\tSTART=%d\n", $1,hour*3600+min*60+sec);}
