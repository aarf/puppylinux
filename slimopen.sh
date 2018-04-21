#!/bin/sh
#opensin slimjet
#xclip -selection primary -o>>/root/input_text.txt
select=$( xclip -selection primary -o )
echo $select
#input_text=`cat /root/input_text.txt`
#rm /root/input_text.txt


#echo "You entered:$input_text"
slimaddress=$( cat slimaddress.txt )

echo $slimaddress
#/mnt/sda11/slimjet_amd64-18.0.3.0.tar.xz*extracted/slimjet/spotslim "$select"
echo $( $slimaddress   "$select" ) 
sleep 25

xdotool   keydown key Return; sleep 0.3; xdotool   keyup Return ;

