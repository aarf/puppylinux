#!/bin/sh
sleep 150
connected=$( ifconfig | grep -v '127.0.0' | grep -i 'inet' )

echo $connected


if [ "$connected" = "" ] 
then 
exit
fi

while :
do
	echo "Press [CTRL+C] to stop.."
		sleep 150
	/root/coinbork.sh
	satsunday=$( date | grep -i "sun" )
if [ "$satsunday" = '' ]
then 
satsunday=$( date | grep -i "sat" )
fi

if [ "$satsunday" = '' ]
then 
sleep 15
	/root/bloocoin.sh
	sleep 15
	/root/bloocmd.sh
fi
	
	sleep 1500
done
