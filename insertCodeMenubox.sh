#!/bin/sh

#DIALOG=${DIALOG=Xdialog}
#tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
#trap "rm -f $tempfile" 0 1 2 5 15

codeselect=`Xdialog --stdout --clear --title "My  Choice" \
        --menubox "Hi, Choose  your choice:" 20 51 4 \
       "[img][/img]" "image" \
        "[url=][/url]" "url" \
       "[quote][/quote]" "quote"  \
        "4" "four" \
        "5"  "five" \
        "6"  "six" `  
        
      #  choice=$codeselect
echo code is $codeselect
case "$codeselect" in
 "[img][/img]")
 NoLeft=6
 NoRight=7
 ;;
 "[url=][/url]")
 NoLeft=7
 NoRight=1 
 ;;
 "[quote][/quote]")
 NoLeft=8 
 NoRight=9
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