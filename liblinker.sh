#!/bin/sh
#usage liblinker.sh libsomethingmissing.x.x in terminal
dsource="$1"
Dsource=$dsource
dsource=$(echo -e $dsource | cut -d"." -f 1 )
dsource=$dsource*
echo $dsource
dir1=/usr/lib

cd $dir1
#search lib directories for something resembling Dsource
#ls  "$dir1"/"$dsource"
found=$(ls $dsource)

#mystring="$dir1"/"$dsource"
mystring="$dsource"
#found=(find . -name 'mystring*')
echo $found
title="Select the file to link $Dsource to"
width=${#title} 
echo $width
#failed to use width in zenity
#display possibilities and select possible
guioutput=$(zenity   --on-top --width "400" --title "Select the file to link $Dsource to " --entry $found)

guioutput2="$dir1"/"$guioutput"
echo $guioutput
cd $dir1
#create symlink
#create /tmp/tmp
mkdir /tmp/tmp
ln -s   -t /tmp/tmp $guioutput2 

#mv /tmp/tmp/$guioutput /$dir1/$Dsource
mv /tmp/tmp/$guioutput /$dir1/$Dsource



