#!/bin/sh
#Usage: data.sh <filename> <id> 
cat ${1}|awk -F'|' '
BEGIN{switchCount=0;lastReading=640;switchDirection=0;lastReportDirection=0;unSwitchCount=0;}
{
 currentAver=$1;
 if (currentAver>lastReading && currentAver-lastReading>SWITCH_THRESHOLD) { # Significant increase
	if (switchDirection==1) {
		switchCount++;
		if (switchCount>=SWITCH_NUMBER) { # Enough significant increase to report a change
			unSwitchCount=2;
			#printf ("UnswitchCount Enabled!\n");
 			lastReading = currentAver;
			#printf("Car detected to have left at time: %d\n",lastSwitchTime);
		}
	} else {
		switchCount=1;
		switchDirection = 1;
		if (switchCount>=SWITCH_NUMBER) { # Enough significant increase to report a change
			unSwitchCount=2;
			#printf ("UnswitchCount Enabled!\n");
 			lastReading = currentAver;
		}
	}
	lastSwitchTime=$2;
 } else if (currentAver<lastReading && lastReading-currentAver>SWITCH_THRESHOLD) { # Significant decrease
 	if (unSwitchCount>0)
		unSwitchCount=0;
	if (switchDirection==1 && switchCount>=SWITCH_NUMBER && lastReportDirection!=1) {
		printf("Left\t%d\n",lastSwitchTime);
		lastReportDirection=1;
		#print $0;
	}
	if (switchDirection==2) {
		switchCount++;
		if (switchCount>=SWITCH_NUMBER) { # Enough significant decrease to report a change
	 		lastReading = currentAver;
			if (lastReportDirection!=2) {
				printf("Reached\t%d\n",lastSwitchTime);
				lastReportDirection=2;
			}
		}
	} else {
		switchCount=1;
		switchDirection = 2;
		if (noReport!=TRUE && switchCount>=SWITCH_NUMBER) { # Enough significant decrease to report a change
 			lastReading = currentAver;
			if (lastReportDirection!=2) {
				printf("Reached\t%d\n",lastSwitchTime);
				lastReportDirection=2;
			}
		}
	}
	if (switchCount==1)
		lastSwitchTime=$2;
 } else { # No significant change
 	 if (unSwitchCount>0)
		unSwitchCount--;
	else if (switchDirection==1 && switchCount>=SWITCH_NUMBER && lastReportDirection!=1) {
		printf("Left\t%d\n",lastSwitchTime);
		lastReportDirection=1;
		#print $0;
	}
	else {
	switchDirection = 0;
	switchCount = 0;
	}
 }
}
END{
 if (eventCount-1==0)
	printf("Event not detected for sensor: %d!\n", $1);
 else {
	#printf("EVENT:\t%d\t%d\t%d\t%d\n", SWITCH_THRESHOLD, SWITCH_NUMBER, $1, eventCount-4);
	#printf("EVENT:\t%d\t%d\t%d\t%d\n", SWITCH_THRESHOLD, SWITCH_NUMBER, $1, eventCount-4);
	#printf("Events detected for sensor %d as %d, false rate %f\n", $1, eventCount-1, (eventCount-2)/(eventCount-1));
}}' SWITCH_NUMBER=${2} SWITCH_THRESHOLD=${3}
