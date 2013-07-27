#!/bin/sh
START=0
if [ ${1} -eq 13 ];then
        START=28334
else if [ ${1} -eq 11 ];then
        START=28957
else if [ ${1} -eq 11 ];then
        START=30032
else if [ ${1} -eq 11 ];then
        START=30134
else if [ ${1} -eq 23 ];then
        START=28979
else if [ ${1} -eq 18 ];then
        START=29663
else if [ ${1} -eq 31 ];then
        START=30266
else if [ ${1} -eq 22 ];then
        START=29773
else if [ ${1} -eq 17 ];then
        START=29269
else if [ ${1} -eq 24 ];then
        START=30338
else if [ ${1} -eq 26 ];then
        START=30984
else if [ ${1} -eq 34 ];then
        START=29267
else if [ ${1} -eq 12 ];then
        START=30107
else if [ ${1} -eq 25 ];then
        START=31107
else if [ ${1} -eq 20 ];then
        START=31024
else if [ ${1} -eq 29 ];then
        START=30815
else if [ ${1} -eq 4 ];then
        START=30865
else if [ ${1} -eq 8 ];then
        START=30609
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
WINDOW=1
THRESHOLD=20
cat /dev/null>result.txt
while [ $WINDOW -le 8 ]
do
while [ $THRESHOLD -le 50 ]
do
	#echo "./delay.sh processed.log ${1} $WINDOW $THRESHOLD $START 2:" >>result.txt
	./delay.sh processed.log ${1} $WINDOW $THRESHOLD $START 2 >>result.txt
	THRESHOLD=`expr $THRESHOLD + 10`
done
THRESHOLD=20
WINDOW=`expr $WINDOW + 1`
done
#	cat result.txt|sort -n -t'	' +1 -3
