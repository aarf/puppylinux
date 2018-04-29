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
#/mnt/sda11/slimjet_amd64-18.0.3.0.tar.xz_extracted/slimjet/spotslim http://www.tropicalstormrisk.com/tracker/dynamic/main.html
#/mnt/sda11/slimjet_amd64-18.0.3.0.tar.xz.extracted/slimjet/spotslim http://www.tropicalstormrisk.com/tracker/dynamic/main.html
slimaddress=$( cat /root/slimaddress.txt )
echo $( $slimaddress   http://www.tropicalstormrisk.com/tracker/dynamic/main.html ) 

fi  

