#!/bin/sh
##need internet connection
#before starting need to rename the downloaded tar.xz eg slimjet_amd64-16.0.8.0.tar.xz
#put this script and the downloaded slimjetXXX.tar.gz into the place where you want the portable install
#need uextract to be installed
#click startslimjet.sh after install to run 

uextract slimjet*tar.xz



found=$(ls slimjet*.tar.xz.extracted  )
echo "$found"
 found=$(echo -e "$found" | tail -n 2 )

echo "$found"
dir=$(echo -e $found | cut -d":" -f 1 )
echo $dir

cd $dir/slimjet
rm  flashpeak-slimjet 

 wget  -4c https://raw.githubusercontent.com/aarf/puppylinux/master/flashpeak-slimjet 
 wget -4c  https://raw.githubusercontent.com/aarf/puppylinux/master/startslimjet.sh 
 cdline=$(pwd)
 cdline="cd ""$cdline"
 echo "$cdline"
 #my gawd will you look at this nonsense the sed line below wont work if  / is in $cdline
 cdline=$(echo ${cdline//"/"/"\/"})
 #have tried just using pwd but it has issues with either desktop link or startup link (both to come in next editions of this script) 
 #for now do these manually if you want them
sed -i "1s/.*/$cdline/" startslimjet.sh
exit