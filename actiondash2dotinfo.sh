#!/bin/sh
xclip -selection primary -o>>/root/input_text.txt
input_text=`cat /root/input_text.txt`
rm /root/input_text.txt


echo "You entered:$input_text"

#xdotool sleep 0.3 type --clearmodifiers "${input_text//-/.}"

/mnt/sda12/opera-12.16-1860.x86_64.linux/opera http://www.infosniper.net/index.php?ip_address="${input_text//-/.}"&map_source=1&overview_map=1&lang=1&map_type=1&zoom_level=7



