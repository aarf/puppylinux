#!/bin/sh
 #tr '[:upper:]' '[:lower:]' < STRING.TXT > output.txt
 #cat output.txt
 xclip -o>>input_text.txt
input_text=`cat /root/input_text.txt`
output=""
echo $input_text 
tr '[:upper:]' '[:lower:]' < input_text.txt | xclip 
output=$(tr '[:upper:]' '[:lower:]' < input_text.txt ) 
echo $output
xdotool sleep 0.3 type --clearmodifiers "$output"

rm input_text.txt

 