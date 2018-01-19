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
 
 wget  -4c $line  -O "$name" |  md5sum "$name">>updatecheck_md5sum.txt

done 
diff updatecheck_md5sum.txt /root/.config/newpagechecker
#mv updatecheck_md5sum.txt /root/.config/newpagechecker

#for new in $(cat updatecheck_md5sum.txt   ); do

#done
