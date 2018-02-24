#!/bin/sh
/root/gogogofatdog.sh
sleep 150

connected=$(ifconfig wlan0 | grep -i 'inet' )
if [ "$connected" = "" ] 
then 
exit
fi

cd /tmp
rm updatecheck_md5sum.txt

for line in $(cat /root/UrlToCheck.txt   ); do
 echo "$line"     
#name= $("///" | tr '[/]' '[_]' )

name="${line//http:\/\//}" 
name="${name//www./}" 
name="${name//\//-}" 
name="${name//\?/}" 
name="${name//=/}" 
echo $name
rm $name
name=$name.txt
rm $name
 #wget  -4c $line -O fileurl.txt | md5sum fileurl.txt>>updatecheck_md5sum.txt
 
 wget  -4c $line  -O "$name" 
 nooflines=$(wc -l <$name)
 echo $nooflines
 cutoff=$(echo "$((nooflines * 2 / 3))")
 if [ $name = "lightofdawn.org-blog-viewCatFatdog64" ]
 then cutoff="110"
 fi
 echo "$cutoff"
 name2=$name-2
 #head -n $cutoff $name>$name2
 #patterntomatch="ID generation took"
 #sed -i '/Users Online/d' ./"$name2"
 #sed -i '/Header ID generation took/d' ./"$name2"
 name3=${name:0:6}
  if [ $name3 = "distro" ]
 then name2=$(echo "$name")
 else 
 #need to sort this for different lenght numbers eg 10 today 5 tomorrow will give false positive
   #tr '0123456789' '0' < $name > $name2
  # dont work try regex tr '0123456789' '' < $name > $name2
 #  tr -d 0-9 < $name > $name2
 tr -d 0-9 < "$name" > "$name2"
fi
md5name2=$(md5sum "$name2") 
#echo "$md5name2[0]"
#if [ "$md5name2" = "d41d8cd98f00b204e9800998ecf8427e "$name2"" ]
if [ "$cutoff" = "0" ]

then
xcowsay -t 0 --image /usr/share/icons/qpupster.png "$name has failed to download, the reference md5sums will not be updated"
nodownload="1"
else 
md5sum "$name2">>updatecheck_md5sum.txt

fi
done 
say=$(diff updatecheck_md5sum.txt /root/.config/newpagechecker/updatecheck_md5sum.txt)
#diff lightofdawn.org-blog-viewCatFatdog64 /root/.config/newpagechecker/lightofdawn.org-blog-viewCatFatdog64


if [ "$nodownload" = "1" ] 
then 
exit
fi

if [ "$say" = "$old" ]

then true
else xcowsay -t 0 --image /usr/share/icons/qpupster.png "$say"
  Xdialog --yesno  "The reference md5sums will be updated in you click Yes"   5 100 ; yes=$?
#update if yes
if [ $yes = "0" ] 
then mv updatecheck_md5sum.txt /root/.config/newpagechecker
fi
fi
#tr '\r' '\n' < new > newer
