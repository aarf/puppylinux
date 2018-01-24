#!/bin/sh

cd /tmp

#http://www.lightofdawn.org/blog/?viewCat=Fatdog64
#wget  -4c http://www.lightofdawn.org/blog/?viewCat=Fatdog64 -O lightofdawn.txt | md5sum lightofdawn.txt >lightofdawnmd5sum.txt
 wget  -4c http://distro.ibiblio.org/fatdog/ -O fatdog.txt 
 md5sum fatdog.txt >fatdogmd5sum.txt
new=$(cat fatdogmd5sum.txt)
echo $new

old=$(cat /root/.config/newpagechecker/fatdogmd5sum.txt)
#delete index.html
if [ "$new" = "$old" ]

then true
#then fi
else xcowsay -t 0 --image /usr/share/icons/qpupster.png "fatdog has changed"
mv fatdogmd5sum.txt  /root/.config/newpagechecker
fi

#new=$(cat lightofdawnmd5sum.txt)
echo $new

#old=$(cat /root/.config/newpagechecker/lightofdawnmd5sum.txt)
#delete index.html
#if [ "$new" = "$old" ]

#then exit
#then true
#else xcowsay -t 0 --image /usr/share/icons/qpupster.png "lightofdawn has changed"
#mv lightofdawnmd5sum.txt  /root/.config/newpagechecker
#fi

#root# curl -s -v -X HEAD http://bkhome.org 2>&1 | grep '^< Last-Modified:'
#< Last-Modified: Mon, 13 Nov 2017 10:26:38 GMT


