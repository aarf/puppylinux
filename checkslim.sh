#!/bin/sh
cd /tmp
sleep 150
name="slimjet"
line="https://www.slimjet.com/en/dlpage.php"
wget  -4c $line  -O "$name" 

versionslim=$(grep  -o  'Stable V..................'  $name)
versionslim=$(echo "$versionslim" | head -1 )
oldverslim=$(cat /root/.config/newpagechecker/oldverslim)
if [ "$versionslim" = "$oldverslim" ]
then exit
fi
say="Current installed version of Slimjet is $oldverslim, available for download now is $versionslim"
xcowsay -t 0 --image /usr/share/icons/qpupster.png "$say"
  Xdialog --yesno  "The current installed version will be updated in you click Yes"   5 100 ; yes=$?
#update if yes
if [ $yes = "0" ] 
 then 
 echo "$versionslim" >/root/.config/newpagechecker/oldverslim
fi
