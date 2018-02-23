#!/bin/sh
sleep 60
cd /tmp
wget  -4c http://www.tropicalstormrisk.com/tracker/dynamic/main_.html

noactive=$(grep -i 'no active' main*)
if [ "$noactive" = "" ] 
then
/mnt/sda11/slimjet_amd64-18.0.1.0.tar.xz_extracted/slimjet/spotslim http://www.tropicalstormrisk.com/tracker/dynamic/main.html

fi  

