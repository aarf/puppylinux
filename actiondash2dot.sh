#!/bin/sh
xclip -selection primary -o>>/root/input_text.txt
input_text=`cat /root/input_text.txt`
rm /root/input_text.txt


echo "You entered:$input_text"

xdotool sleep 0.3 type --clearmodifiers "${input_text//-/.}"





