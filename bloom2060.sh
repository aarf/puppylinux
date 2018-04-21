#!/bin/sh
#this takes the blurred image from bloomberg from the clipboard and pastes it into the browser with a proper image resoultion. . activated from sven or bottom tray
#xclip -selection primary -o>>/root/input_text.txt
#input_text=`cat /root/input_text.txt`
#rm /root/input_text.txt

select=$( xclip -selection primary -o )
echo $select
slimaddress=$( cat slimaddress.txt )
#echo "You entered:$input_text"
#mod2060=${select//60/2060}
mod2060=${select//60/2060}
#/mnt/sda11/slimjet_amd64-18.0.3.0.tar.xz*extracted/slimjet/spotslim  "$mod2060"
echo $( $slimaddress   "$mod2060" ) 


#xdotool sleep 0.3 type --clearmodifiers "${select//60/2060}"
xdotool   keydown key Return; sleep 0.3; xdotool   keyup Return ;

