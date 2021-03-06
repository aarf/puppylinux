#!/bin/sh


codeselect=`Xdialog --stdout --clear --title "Choose code to type" \
        --menubox "Hi, select your choice. The code will be typed in addition to the current clipboard entry. Be sure the active window is able to be typed to:" 20 131 4 \
       "[img][/img]" "image" \
        "[url=][/url]" "url" \
       "[quote][/quote]" "quote"  \
        "wget -4c \"\"" "wget" \
        "KuLuSz"  "Madafakkar" \
        "var=(echo \"var\"  )"  "code" \
        "echo \"var\" >> "  "code" \
        "md5sum "  "md5sum" `  
        

echo code is $codeselect
case "$codeselect" in
 "[img][/img]")
 NoLeft=6
 NoRight=7
 ;;
"var=(echo \"var\"  )")
 NoLeft=7
 NoRight=0
 ;;
 "echo \"var\" >> ")
 NoLeft=8
 NoRight=0
 ;;
 "[url=][/url]")
 NoLeft=7
 NoRight=1 
 ;;
 "[quote][/quote]")
 NoLeft=8 
 NoRight=9
 ;; 
 "wget -4c \"\"")
 NoLeft=1
 ;; 
 esac
retval=$?

#choice=`cat $tempfile`

case $retval in
  0)
    echo "'$codeselect' is your choice";;
  1)
    echo "Cancel pressed.";;
  255)
    echo "ESC pressed.";;
esac
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

xdotool sleep 0.3 type --clearmodifiers "${input_text//-/-}"

if  [ "$codeselect" = "[url=][/url]" ] 
then xdotool   keydown key Right; sleep 0.3; xdotool   keyup Right ;
fi
if  [ "$codeselect" = "[img][/img]" ] 
then 
COUNTER=0
         while [  $COUNTER -lt $NoRight ]; do
             xdotool   keydown key Right; sleep 0.3; xdotool   keyup Right ;
             let COUNTER=COUNTER+1 
         done
#xdotool   keydown key Right; sleep 0.3; xdotool   keyup Right ;
fi
if  [ "$codeselect" = "wget -4c \"\"" ] 
then 
xdotool   keydown key Right; sleep 0.3; xdotool   keyup Right ;
xdotool   keydown key Return; sleep 0.3; xdotool   keyup Return ;
fi
#fi
