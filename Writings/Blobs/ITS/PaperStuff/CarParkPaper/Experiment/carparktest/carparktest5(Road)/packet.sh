#!/bin/sh
cat ${1}|grep "^${2}|"|awk -F'|' '
BEGIN{lasttime=0;count=0;seq=0;missed=0;trantime=2;rate=0.0;}
{if ($6>=start+interval){
	while(start+interval<=$6) {
		if (lasttime!=0&&lasttime>=start) {
			missed+=(start+interval-lasttime)/trantime;
			missed-=(missed%1);
		} else if (lasttime!=0) {
			missed = (start+interval-lasttime)/trantime;
			missed-=(missed%1);
		}
		if(count+missed>0) {
			rate = count/(count+missed);
			printf("%d:%d:%d\t%d:%d:%d\t%f\n",start/3600,start%3600/60,start%60,(start+interval)/3600,(start+interval)%3600/60,(start+interval)%60,count/(count+missed));
		}
		else
			printf("%d:%d:%d\t%d:%d:%d\tN/A\n", start/3600,start%3600/60,start%60,(start+interval)/3600,(start+interval)%3600/60,(start+interval)%60);
		start+=interval;
	}
	count=missed=0;
 }
 count++;
 if (count==1) {
	missed=missed+($6-start)/trantime;
	missed-=(missed%1);
	#printf("Missed: %f|", missed);
 }
 else if (seq!=0) {
	if($4<seq) 
		seq-=255;
	missed+=$4-seq-1;
 }
 seq=$4;
 lasttime=$6;
}
END{
 while(start+interval<=$6) {
   if (lasttime!=0&&lasttime>=start) {
      missed+=(start+interval-lasttime)/trantime;
      missed-=(missed%1);
   } else if (lasttime!=0) {
      missed = (start+interval-lasttime)/trantime;
      missed-=(missed%1);
   }
   if(count+missed>0) {
     rate = count/(count+missed);
     printf("%d:%d:%d\t%d:%d:%d\t%f\n",start/3600,start%3600/60,start%60,(start+interval)/3600,(start+interval)%3600/60,(start+interval)%60,count/(count+missed));
   }
   else
     printf("%d|%d|N/A\n", start, start+interval);
     start+=interval;
   }
}' start=${3} interval=${4}
