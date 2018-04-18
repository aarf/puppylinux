#!/bin/sh
#opensin slimjet
#xclip -selection primary -o>>/root/input_text.txt
select=$( xclip -selection primary -o )
echo $select
#input_text=cat /root/input_text.txt
#rm /root/input_text.txt
slimaddress=$( cat slimaddress.txt )


echo "You entered:$slimaddress" 

#/mnt/sda11/slimjet_amd64-18.0.4.0.tar.xz*extracted/slimjet/spotslim https://www.google.com/maps/place/"$select"
 echo $( $slimaddress   https://www.google.com/maps/place/"$select" ) 
sleep 25

xdotool   keydown key Return; sleep 0.3; xdotool   keyup Return ;

