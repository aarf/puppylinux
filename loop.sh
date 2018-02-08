#!/bin/sh
while :
do
	echo "Press [CTRL+C] to stop.."
		sleep 150
	/root/coinbork.sh
	sleep 15
	/root/bloocoin.sh
	sleep 15
	/root/bloocmd.sh
	sleep 600
done
