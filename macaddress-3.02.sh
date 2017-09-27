#!/bin/sh 
#sleep 10
#loop if no change possibly working
#needs to be located in /root/Startup else you will need to change the path further down. macaddress3 can be used by clicking it whenever 
#fixed no more writing to file
#ranting removed
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
input=$( ifconfig wlan0  | grep 'HWaddr' | cut -d':' -f 2-7 ) 

#ifconfig wlan0 > /tmp/input.txt


#input="$(grep -i HW /tmp/input.txt)"

 echo "$input"


 ifconfig $IFACE down 
 ifconfig $IFACE hw ether "$NEW_MAC" 
 
 ifconfig $IFACE up 
 echo "$NEW_MAC"
 
 output=$( ifconfig wlan0  | grep 'HWaddr'  | cut -d':' -f 2-7) 
 #ifconfig wlan0 > /tmp/output.txt
  #output="$(grep -i HW /tmp/output.txt)"
 echo "$output"
 
 
 if [ "$input" = "$output" ]; 
 
 then {$(/root/Startup/macaddress-3.02.sh)}  #possibly working, want to restart the script from the begining
 /root/gogogofish.sh
 #echo $(ifconfig wlan0)
 echo "new assigned address is " $( ifconfig wlan0  | grep 'HWaddr' | cut -d':' -f 2-7 ) 
 else echo "different assigned address is" $( ifconfig wlan0  | grep 'HWaddr' | cut -d':' -f 2-7 ) 
  
 fi