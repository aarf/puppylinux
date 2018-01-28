#!/bin/sh           

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
  tr '0123456789' '0' < $name > $name2
fi
md5sum "$name2">>updatecheck_md5sum.txt
done 
say=$(diff updatecheck_md5sum.txt /root/.config/newpagechecker/updatecheck_md5sum.txt)
#diff lightofdawn.org-blog-viewCatFatdog64 /root/.config/newpagechecker/lightofdawn.org-blog-viewCatFatdog64




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
