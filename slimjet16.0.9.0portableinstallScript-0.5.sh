#!/bin/sh
##need internet connection
#put this script  into the place where you want the portable install
#need uextract to be installed
#click .../slimjet_amd64-XXXXX.tar.xz.extracted/slimjet/startslimjet.sh after install to run 

#wget -4c https://www.slimjet.com/en/dlpage.php 
wget  -4c https://www.slimjet.com/release/archive/16.0.9.0/slimjet_amd64.tar.xz

RegExStr="<h3*h3>"
#curver=$(grep -o '<h3 >S.*.h3>' "dlpage.php") 
#curver=$(grep -o 'Stable.*.h3' "dlpage.php") 
curver=$(grep -o 'Stable.*.h3' "dlpage.php" | cut -d'(' -f 2 | cut -d')' -f 1 ) 
 #found=$(echo -e "$found" | tail -n 2 )

curver=$(echo -e "$curver" | tail -n 1 )
#egrep -o $RegExStr "dlpage.php" > tezt.txt
curver="16.0.9.0"
echo "$curver"

#wget -4c http://www.slimjetbrowser.com/release/slimjet_amd64.tar.xz
mv slimjet_amd64.tar.xz slimjet_amd64-$curver.tar.xz
#rm dlpage.php



#uextract slimjet*tar.xz
uextract slimjet_amd64-$curver.tar.xz


found=$(ls slimjet*.tar.xz.extracted  )
echo "$found"
 found=$(echo -e "$found" | tail -n 2 )

echo "$found"
dir=$(echo -e $found | cut -d":" -f 1 )
dir=slimjet_amd64-16.0.9.0.tar.xz.extracted
echo $dir

cd $dir/slimjet
rm  flashpeak-slimjet 

 wget  -4c https://raw.githubusercontent.com/aarf/puppylinux/master/flashpeak-slimjet 
 wget -4c  https://raw.githubusercontent.com/aarf/puppylinux/master/startslimjet.sh 
 cdline=$(pwd)
 cdline="cd ""$cdline"
 echo "$cdline"
 #the sed line below wont work if  / is in $cdline
 cdline=$(echo ${cdline//"/"/"\/"})
 #have tried just using pwd but it has issues with either desktop link or startup link (both to come in next editions of this script) 
 #for now do these manually if you want them
sed -i "1s/.*/$cdline/" startslimjet.sh
#chmod startslimjet and flashpeak-slimjet 
chmod a+x,go-rwx start* flashpeak*
 
exit