#!/bin/sh
 #tr '[:upper:]' '[:lower:]' < STRING.TXT > output.txt
 #cat output.txt
 xclip -o>>input_text.txt
input_text=`cat /root/input_text.txt`

echo $input_text 
tr '[:upper:]' '[:lower:]' < input_text.txt | xclip 
rm input_text.txt

 