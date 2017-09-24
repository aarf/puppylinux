#!/bin/bash

HIIP=20

until [ $HIIP -lt 0 ]; do
    echo -n " : HIone " $HIIP
    
    ifconfig wlan0>>/tmp/Test.txt
    
    #RegExStr="addr:[0-9].[0-9].[0-9].[0-9]"
    RegExStr="addr:[0-9]+.[0-9]+.[0-9]+.[0-9]+."
egrep -o $RegExStr "/tmp/Test.txt" > /tmp/Test2.txt
rm /tmp/Test.txt
while read p; do
TEST=${p}
done </tmp/Test2.txt
rm /tmp/Test2.txt

echo -n "test is qnow" $TEST
 
   if [ $TEST ]; then /root/spot/tor-browser_en-US/NewSuSpot.sh & exit
fi 
    let HIIP-=1
 let X=20-$HIIP
 echo -n " : HItwo" $HIIP
 echo -n " :X is " $X
sleep $X
done

exit 0
