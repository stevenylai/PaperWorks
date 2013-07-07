#!/bin/sh
cat ${1}|grep "^${2}|"|awk -F'|' '
BEGIN{count=0;data=0;rate=0.0;start=start+0;}
{
 if (start+0==0 && NR==1) {
	 start=$6;
 }
 if ($6>=start+interval){
	while(start+interval<=$6) {
		if (count!=0)
			rate = data/count;
	� lse
			rate = 0;
		printf("%d:%d:%d\t%d:%d:%d\t%f\n",start/3600,start%3600/60,start%60,(start+interval)/3600,(start+interval)%3600/60,(start+interval)%60,rate);
		start+=interval;
		data=0;
 		count=0;
	}
 }
	count++;
	data+=$2;

}' interval=${3} start=${4}
