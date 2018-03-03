#!/bin/sh
sleep 60
cd /tmp
wget  -4c http://www.tropicalstormrisk.com/tracker/dynamic/main_.html
connected=$(ifconfig wlan0 | grep -i 'inet' )
if [ "$connected" = "" ] 
then 
exit
fi

noactive=$(grep -i 'no active' main*)
if [ "$noactive" = "" ] 
then
defaultbrowser http://www.tropicalstormrisk.com/tracker/dynamic/main.html

fi  

