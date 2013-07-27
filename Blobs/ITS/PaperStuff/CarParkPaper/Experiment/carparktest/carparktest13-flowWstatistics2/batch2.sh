#!/bin/sh
START=0
if [ ${1} -eq 28 ];then
        START=29053
else if [ ${1} -eq 31 ];then
        START=29185
else if [ ${1} -eq 8 ];then
        START=29667
else if [ ${1} -eq 11 ];then
        START=29829
#else if [ ${1} -eq 37 ];then
        #START=30846
else if [ ${1} -eq 37 ];then
        START=32525
#else if [ ${1} -eq 37 ];then
        #START=32623
else if [ ${1} -eq 22 ];then
        START=30248
else if [ ${1} -eq 30 ];then
        START=30659
else if [ ${1} -eq 24 ];then
        START=30804
else if [ ${1} -eq 1 ];then
        START=31594
else if [ ${1} -eq 2 ];then
        START=30955
else if [ ${1} -eq 15 ];then
        START=31120
else if [ ${1} -eq 23 ];then
        START=31421
else if [ ${1} -eq 26 ];then
        START=31338
else if [ ${1} -eq 6 ];then
        START=31319
else if [ ${1} -eq 21 ];then
        START=32007
else if [ ${1} -eq 3 ];then
        START=32660
else if [ ${1} -eq 36 ];then
        START=32779
else if [ ${1} -eq 18 ];then
        START=32864
else if [ ${1} -eq 33 ];then
        START=33067
else if [ ${1} -eq 29 ];then
        START=33238
#fi
#fi
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
	./data.sh processed.log ${1} $WINDOW $THRESHOLD $START 2 >>result.txt
	THRESHOLD=`expr $THRESHOLD + 10`
done
THRESHOLD=20
WINDOW=`expr $WINDOW + 1`
done
#	cat result.txt|sort -n -t'	' +1 -3
