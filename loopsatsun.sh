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
	
	var=$(TZ='Africa/Johannesburg' date)
echo $var
satsunday=$( echo $var | grep -i "sat" )
echo sat is $satsunday



echo $satsunday
if [ "$satsunday" = '' ]
then 

satsunday=$( date  | grep -i "sun" )

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
