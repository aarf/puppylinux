#!/bin/sh
#sleep 150
ARCH=$(uname -m)
lsuffix=


case "$ARCH" in #01micko, support 64 bit
 i?86)CHECKURL='http://get.adobe.com/flashplayer/download/?installer=Flash_Player_11.2_for_other_Linux_(.tar.gz)_32-bit&standalone=1'
      ;;
 #'http://get.adobe.com/flashplayer/download/?installer=Flash_Player_11.2_for_other_Linux_(.tar.gz)_64-bit&standalone=1'
*64)CHECKURL='https://get.adobe.com/flashplayer/download/?installer=FP_27.0_for_Linux_64-bit_(.tar.gz)-_PPAPI&stype=6702&standalone=1'
     lsuffix=64 ;;
   *)exit 1;;
esac
echo "check URL IS $CHECKURL"
     
    #curl is broken in easy04  
     #*64)DOWNLOADURL=$(curl -s "$CHECKURL" | grep -o 'https://fpdownload.*inux.x86_64.tar.gz') ;;
#*64)DOWNLOADURL=$(wget -4c "$CHECKURL" | grep -o 'https://fpdownload.*inux.x86_64.tar.gz') ;;
# *64)DOWNLOADURL=$(  grep -o 'https://fpdownload.*inux.x86_64.tar.gz'  "checkindex.html" ) ;;


     case "$ARCH" in
      i?86)DOWNLOADURL=$(curl -s "$CHECKURL" | grep -o 'https://fpdownload.*inux.i386.tar.gz') ;;
      *64) wget -4c "$CHECKURL" -O "/tmp/checkindex.html" 
      DOWNLOADURL=$(  grep -o 'https://fpdownload.*inux.x86_64.tar.gz'  "/tmp/checkindex.html" ) ;;


     esac
   
      echo "download URL is $DOWNLOADURL"
 
     
     if [ ! "$DOWNLOADURL" ];then 
      #mysplash -bg hotpink -timeout 5 -icon gtk-dialog-error "$_UNABLE_SERVER"
      echo "no DOWNLOADURL"
      exit 1
     fi
    echo "$DOWNLOADURL" >&2
   
     NEWVERSION=$(dirname "$DOWNLOADURL")
     NEWVERSION=$(basename "$NEWVERSION")
     echo "NEWVERSION=$NEWVERSION"
#ok to here now need to deal with curl again or wait till curl is fixed?

     LENGTH=$(curl -s -I "$DOWNLOADURL" | grep -i 'Content-Length:' | cut -s -f2 -d':'| tr -dc '0-9') || LENGTH=0
     NEWMB=$((($LENGTH + 52429) / 104858))
     if [ $NEWMB -gt 0 ] ; then
       L=$(echo -n $NEWMB | wc -c)
       M=$(($L -1))
       NEWMB="$(echo $NEWMB -n | cut -c-$M).$(echo -n $NEWMB | cut -c$L)MB"
     else NEWFB='---'
     fi
#want this for slimjet not seamonkey

if [ ! -f /usr/lib${lsuffix}/mozilla/plugins/libflashplayer* ];then
  FLASHVERSION="0"
  TEXT=$(gettext "The Adobe Flash Player for the web browser is not installed.")
else
  FLASHVERSION=$(busybox strings -n13 /usr/lib${lsuffix}/mozilla/plugins/libflashplayer*  | grep 'FlashPlayer_' | cut -d '_' -f2-5| tr '_' '.')
  echo "INSTALLED=$FLASHVERSION" >&2
  fi
echo "$FLASHVERSION"
echo "$NEWVERSION"

if [ "$FLASHVERSION" = "$NEWVERSION" ] ;then  
#popup "name=bk1 background='#279CFA' placement=top-middle width=-1|<b>FlashPlayer</b> <big>current</big> <small>version</small> <i>installed</i> <tt>$FLASHVERSION</tt>"

#echo "terminate=5 timecount=dn writemode=append-newline|Popup will terminate in <big><b><span color='#ff0000'>COUNT</span></b></big> seconds" >> /tmp/popup_bk1
echo "do nothing" >&2
#xmessage -center "Newer version of FlashPlayer isnt available.."
elif [ "$FLASHVERSION" = "0" ]
then
	echo "do nothing" >&2
elif [ "$FLASHVERSION" = "10.3.183.90" ]
then
	echo "do nothing" >&2	
elif [ "$FLASHVERSION" = "9_pretend10-20110327" ]
then
		 echo "do nothing" >&2
else
popup "name=bk1 background='#279CFA' placement=top-middle width=-1|<b>Newer version of FlashPlayer is available... GetFlash in the Menu>Internet can be used to install the new version</b>"

echo "terminate=20 timecount=dn writemode=append-newline|Popup will terminate in <big><b><span color='#ff0000'>COUNT</span></b></big> seconds" >> /tmp/popup_bk1

xmessage -center "Newer version of FlashPlayer is available at http://www.adobe.com/software/flash/about/.."

fi
