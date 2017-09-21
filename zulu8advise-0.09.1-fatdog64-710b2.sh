#!/bin/sh
sleep 150
#change sleep to the do loop in start tor browser or put the loop down by the wget to no connection section
#try to get popup installed. it is in zzzflashadvise.pet but popup wont work in fatdog64-710b2
# this vession uses xmessage to advise for when popup isnt installed
#perhaps use the wifi connect script from tor to await wifi connection?
echo "start"
cd /tmp
java -version > /tmp/InstalledVERSION 2>&1

RegExStr='\"(.+?)\"' #everything inside of quotes including quotes ""

instv=$(egrep -o $RegExStr "/tmp/InstalledVERSION")
echo "instv = $instv"

#RegExStr="[0-9][0-9]"
#egrep -o $RegExStr "/tmp/instv" > /tmp/updateNo
#from getjava.sh fatdog UPDATE=${LATEST#*_}
#while read p; do
#preupdateNo=${p}
#done </tmp/instv

#instv=$(head -n 1 instv) #put installed version string into variable from file instv
#echo $instv
preupdateNo=${instv#*_} #everything after _
echo $preupdateNo
updateNo=${preupdateNo%\"*} #remove trailing "
#updateNo=${instv#_*\"} failed to do in one line
echo "installed update number $updateNo"



##wget -4c http://www.java.com/en/download/
#wget -4c http://www.oracle.com/technetwork/java/javase/downloads/
#note that this will not replace an existing index.html
wget -4c http://www.azul.com/downloads/zulu/zulu-linux/
##grep -i "Version [0-9] Update [0-9]" index.html > /tmp/CURRENTVersion
##grep -i "Java Platform (JDK) [0-9]u[0-9]" index.html > /tmp/CURRENTVersion

#lists all lines which include versions numbers on the page
#grep -i "[0-9]u[0-9]" index.html > /tmp/CURRENTVersion

#want only the first line which has the latest version number
#CurrentVersion=$(head -n 1 CURRENTVersion) #still includes left over html code
#echo "$CurrentVersion"

#use RegExStr to removed html. use plus signs (+) for variable length numbers http://stackoverflow.com/questions/7407099/regex-match-numbers-of-variable-length#7407127

RegExStr="[0-9]+u[0-9]+"

egrep -o $RegExStr "/tmp/index.html" > /tmp/Cur_updateNo
line=$(head -n 1 Cur_updateNo) # gives only the first line which is latest version online 


echo "first line" $line

 if [ ! "$line" ];then 
      
xmessage  -center  -timeout 5  -bg 'navy blue' -fg 'white'    "Internet isn't currently connected" 


      exit 1
     fi
 
#echo $CURRENTVersion
#while read p; do
#Cur_updateNo=${p}
#done </tmp/Cur_updateNo

#RegExStr="[0-9][0-9][0-9]"
#egrep -o $RegExStr "/tmp/Cur_updateNo" > /tmp/Cur_updateNo2

#while read p; do
#Cur_updateNo2=${p}
#done </tmp/Cur_updateNo2



echo Latest available Java update number is $line . The currently installed Java update is number $instv


#if [ "$line" ! < = "$updateNo" ] ;then

#lineupdateNo=${line:2:3 }
#http://commandliners.com/2015/04/string-manipulation-in-bash/
lineupdateNo="${line#*u}"
linebaseversion="${line%u*}"
echo "lineupdateNo is $lineupdateNo"
echo "linebaseversion is $linebaseversion"
#first need to check if linebaseversion=8 is later than instv = "1.8.0_112" this is tricky since they are expressed in different number strings eg. "1.8.0_112" versus 8u112 perhaps just match for an 8 in the preterm 1.8.0 for now but they may go to 1.8.1_ , and not to 9, match for 8.0 instead?

if [ "$lineupdateNo" -ne "$updateNo" ] ;then
popup "name=bk1 background='#279CFA' placement=top-middle width=-1|<b>Latest available Java Zulu update is $line from http://www.azul.com/downloads/zulu/zulu-linux/... If you dont want to see this message, move the file named zulu8advise-0.08 out of /root/Startup </b>"
echo "terminate=20 timecount=dn writemode=append-newline|Popup will terminate in <big><b><span color='#ff0000'>COUNT</span></b></big> seconds" >> /tmp/popup_bk1

xmessage  -center  -timeout 30  -bg '#279CFA' -fg 'white'    "Latest available Java Zulu update is $line from http://www.azul.com/downloads/zulu/zulu-linux/ " 

xmessage  -center  -timeout 30  -bg '#279CFA' -fg 'white'    "The currently installed Java update is number $instv " 

xmessage  -center  -timeout 30  -bg '#279CFA' -fg 'white'    "If you dont want to see these messages, move the file named zulu8advise-0.08* out of /root/Startup " 

else
echo "do nothing" >&2
fi
