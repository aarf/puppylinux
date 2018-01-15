#!/bin/sh


codeselect=`Xdialog --stdout --title "Insert Code" --combobox "Choose Code to Insert" 0 0 "[img][/img]" "[url=][/url]" "[quote][/quote]"`
 case "$codeselect" in
 "[img][/img]")
 NoLeft=6
 ;;
 "[url=][/url]")
 NoLeft=7 
 ;;
 "[quote][/quote]")
 NoLeft=8 
 ;; 
 esac
#codeselect="[img][/img]"
#NoLeft=6 

xdotool getactivewindow
#xdotool keydown key 1; sleep 1; xdotool keyup 1
xdotool sleep 0.3 type --clearmodifiers "$codeselect"

COUNTER=0
         while [  $COUNTER -lt $NoLeft ]; do
             xdotool   keydown key Left; sleep 0.3; xdotool   keyup Left ;
             let COUNTER=COUNTER+1 
         done


xclip -selection primary -o>>/root/input_text.txt
input_text=`cat /root/input_text.txt`
rm /root/input_text.txt


echo "You entered:$input_text"

xdotool sleep 0.3 type --clearmodifiers "${input_text//-/.}"

 

#xdotool keydown key Left; sleep 1; xdotool   keyup Left
#xdotool --repeat 3 click  Left 

#xdotool keydown key BackSpace; sleep 1; xdotool keyup BackSpace
#xdotool keydown key BackSpace; sleep 1; xdotool keyup BackSpace