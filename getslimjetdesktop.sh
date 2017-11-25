#!/bin/sh
cd /tmp
wget  -4c https://raw.githubusercontent.com/aarf/puppylinux/master/Slimjet.desktop

 #echo $alters
 curver="16.8.0.0"
 dir=/mnt/sda11/slimjet_amd64-$curver.tar.xz.extracted
 alticon="Icon=$dir/slimjet/product_logo_48.png"
alticon=$(echo ${alticon//"/"/"\/"})
 echo  $alticon
 #$dir/slimjet
 sed -i "4s/.*/$alticon/" Slimjet.desktop
 
 altexec="Exec=$dir/slimjet/startslimjet.sh"
 altexec=$(echo ${altexec//"/"/"\/"})
 
 sed -i "6s/.*/$altexec/" Slimjet.desktop
 rm /usr/share/applications/Slimjet.desktop
mw Slimjet.desktop /usr/share/applications
