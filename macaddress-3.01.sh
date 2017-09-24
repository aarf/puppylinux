#!/bin/sh 
#sleep 10
#loop if no change possibly working
#needs to be located in /root/Startup else you will need to change the path further down. macaddress3 can be used by clicking it whenever 

 if [ "$1" = "" ]; then 
    IFACE="wlan0" 
 else 
    IFACE="$1" 
 fi 

 HEX_ARRAY=(0 1 2 3 4 5 6 7 8 9 A B C D E F) 

 function rand_hex(){ 
    let 'RNUM=RANDOM%16' 
    echo "${HEX_ARRAY[$RNUM]}" 
 } 

 function rand_byte(){ 
    echo "$(rand_hex)$(rand_hex)" 
 } 

 NEW_MAC="$(rand_byte):$(rand_byte):$(rand_byte):$(rand_byte):$(rand_byte):$(rand_byte)" 
#input="$(ifconfig wlan0)"
#echo "$input"

ifconfig wlan0 > /tmp/input.txt
# yes one again i have failed to do simple things without writing junk to file with this vile language. have i told you i hate bash

input="$(grep -i HW /tmp/input.txt)"
 echo "$input"
 #

 ifconfig $IFACE down 
 ifconfig $IFACE hw ether "$NEW_MAC" 
 #output={'ifconfig $IFACE hw ether'}
 ifconfig $IFACE up 
 echo "$NEW_MAC"
 
 #output="$(ifconfig wlan0)"
 ifconfig wlan0 > /tmp/output.txt
  output="$(grep -i HW /tmp/output.txt)"
 echo "$output"
 #output2="$(grep  -o "HWaddr" "$output"  )"
 
 #output2="$(ifconfig HWaddr)"
 echo "$output2"
 
 if [ "$input" = "$output" ]; 
 
 then {$(/root/Startup/macaddress-3.01.sh)}  #possibly working, want to restart the script from the begining
 /root/gogogofish.sh
 echo $(ifconfig wlan0)
 else echo "different assigned"
  
 fi