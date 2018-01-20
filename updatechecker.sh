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

 #wget  -4c $line -O fileurl.txt | md5sum fileurl.txt>>updatecheck_md5sum.txt
 
 wget  -4c $line  -O "$name" 
md5sum "$name">>updatecheck_md5sum.txt
done 
say=$(diff updatecheck_md5sum.txt /root/.config/newpagechecker/updatecheck_md5sum.txt)
#diff lightofdawn.org-blog-viewCatFatdog64 /root/.config/newpagechecker/lightofdawn.org-blog-viewCatFatdog64


#for new in $(cat updatecheck_md5sum.txt   ); do

#done

if [ "$say" = "$old" ]

then true
else xcowsay -t 0 --image /usr/share/icons/qpupster.png "$say"
#mv lightofdawnmd5sum.txt  /root/.config/newpagechecker
#mv updatecheck_md5sum.txt /root/.config/newpagechecker

fi
