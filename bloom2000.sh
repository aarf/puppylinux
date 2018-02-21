#!/bin/sh
#this takes the blurred image from bloomberg from the clipboard and pastes it into the browser with a proper image resoultion. need to click in the browser address bar first. activated from sven
xclip -selection primary -o>>/root/input_text.txt
input_text=`cat /root/input_text.txt`
rm /root/input_text.txt


echo "You entered:$input_text"


xdotool sleep 0.3 type --clearmodifiers "${input_text//60/2060}"
xdotool   keydown key Return; sleep 0.3; xdotool   keyup Return ;

