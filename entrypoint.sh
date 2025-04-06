#!/bin/sh

while :
do
	DATE=$(date)
	/opt/zap2xml.pl -u "$USERNAME" -p "$PASSWORD" $OPT_ARGS
	echo "Last run time: $DATE"
	echo "Will run in $SLEEPTIME seconds"
	sleep "$SLEEPTIME"
done
