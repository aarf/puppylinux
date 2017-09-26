#FLASHVERSION=$(strings -n13 /usr/lib${lsuffix}/mozilla/plugins/libflashplayer.so  | grep 'FlashPlayer_' | cut -d '_' -f2-5| tr '_' '.')
  #$(/usr/bin/strings -n13 libpepflashplayer64-25.0.0.148.so  ) > text.txt
  #$FLASHVERSION > TEXT.TXT
    echo "INSTALLED=$FLASHVERSION" >&2

#strings libflashplayer.so | grep -i FlashPlayer





#|grep 'version'| cut -d '_' -f2-5| tr '_' '.'

#FLASHVERSION=$(busybox strings -n13 libpepflashplayer.so  | grep 'FlashPlayer'   )
#echo $FLASHVERSION 
 FLASHVERSION=$(busybox strings -n13 libpepflashplayer.so  | grep 'LNX'  | tr ',' '.' | cut -d' ' -f 2 )
 echo $FLASHVERSION 
 #FLASHVERSION=${FLASHVERSION//,/.}
 echo $FLASHVERSION 
 
 echo ${FLASHVERSION#LNX}
