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
 patterntomatch="Users Online:"
 sed -i '/"$patterntomatch"/d' ./"$name"
 patterntomatch="Your hostname is"
 sed -i '/"$patterntomatch"/d' ./"$name"
 patterntomatch="Page was generated in"
 sed -i '/"$patterntomatch"/d' ./"$name"
 
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
 #yes=$(Xdialog --yesno  "The reference md5sums will be updated in you click Yes"  "Choose" 10 100 ; a=$? )
 Xdialog --yesno  "The reference md5sums will be updated in you click Yes"   5 100 ; yes=$?
#update if yes
if [ $yes = "0" ] 
then mv updatecheck_md5sum.txt /root/.config/newpagechecker
fi
fi
