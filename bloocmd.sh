#!/bin/sh
cd /tmp
#rm bloocommod.txt bloocmdout.txt

#curl  "https://www.bloomberg.com/markets/commodities" --output bloocommod.txt 
  sed -n '/^$/!{s/<[^>]*>//g;p;}' < bloocommod.txt > bloocmdout.txt
  grep  -o 'bbl. [0-9]*.....[0-9]*' bloocmdout.txt > 2cow
#echo "Crude 2cow " >cmdout
  
grep  -o 'MMBtu  [0-9]*.....[0-9]*' bloocmdout.txt >> 2cow
grep  -o 't oz\. [0-9]*.....[0-9]*' bloocmdout.txt >> 2cow
sed -i '1s/^/WTI Crude Oil USD\//' 2cow

sed -i '2s/^/Brent Crude (ICE) USD\//' 2cow
sed -i '3s/^/Natural Gas (Nymex)  USD\//' 2cow
sed -i '4s/^/Gold USD\//' 2cow
sed -i '5s/^/Gold Spot USD\//' 2cow
sed -i '6s/^/Silver USD\//' 2cow
sed -i '7s/^/Platinum USD\//' 2cow

 xcowsay -t 0 --image /mnt/sda11/slimjet_amd64-17.0.9.0.tar.xz.extracted/slimjet/product_logo_128.png <2cow 
 WTI Crude Oil 