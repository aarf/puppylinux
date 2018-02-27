#!/bin/sh
#this takes the blurred image from bloomberg from the clipboard and pastes it into the browser with a proper image resoultion. need to click in the browser address bar first. activated from sven
#xclip -selection primary -o>>/root/input_text.txt
#input_text=`cat /root/input_text.txt`
#rm /root/input_text.txt

select=$( xclip -selection primary -o )
echo $select

#echo "You entered:$input_text"
#mod2060=${select//60/2060}
mod2060=${select//60/2060}
/mnt/sda11/slimjet_amd64-18.0.1.0.tar.xz_extracted/slimjet/spotslim  "$mod2060"


#xdotool sleep 0.3 type --clearmodifiers "${select//60/2060}"
xdotool   keydown key Return; sleep 0.3; xdotool   keyup Return ;

