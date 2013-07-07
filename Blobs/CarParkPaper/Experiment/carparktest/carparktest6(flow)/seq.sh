#!/bin/sh
cat ${1}|grep "^${2}|"|awk -F'|' '
BEGIN{lasttime=0;count=0;seq=0;rate=0.0;}
{if ($6>=start+interval){
	while(start+interval<=$6) {
		rate = count/(30);
		printf("%d:%d:%d\t%d:%d:%d\t%f\n",start/3600,start%3600/60,start%60,(start+interval)/3600,(start+interval)%3600/60,(start+interval)%60,rate);
		start+=interval;
 		count=0;
	}
 }
 if ($4==seq+1) {
	seq=$4;
	count++;
 } else if ($4>seq+1) {
	printf("Seq no: %d is missing?\n", seq+1);
	seq=$4;
	count++;
 }
}
END{
 if ($6>=start+interval){
	while(start+interval<=$6) {
		rate = count/(30);
		printf("%d:%d:%d\t%d:%d:%d\t%f\n",start/3600,start%3600/60,start%60,(start+interval)/3600,(start+interval)%3600/60,(start+interval)%60,rate);
	}
	start+=interval;
 }
}' start=${3} interval=${4}
