#!/bin/sh
#opensin slimjet
#xclip -selection primary -o>>/root/input_text.txt
select=$( xclip -selection primary -o )
echo $select
#input_text=`cat /root/input_text.txt`
#rm /root/input_text.txt


echo "You entered:$input_text"

/mnt/sda11/slimjet_amd64-18.0.1.0.tar.xz_extracted/slimjet/spotslim https://www.google.com.kh/maps/place/"$select"


xdotool   keydown key Return; sleep 0.3; xdotool   keyup Return ;
