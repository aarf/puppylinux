#!/bin/sh
cd /tmp
#rm bloocommod.txt bloocmdout.txt

#curl  "https://www.bloomberg.com/markets/commodities" --output bloocommod.txt 
  sed -n '/^$/!{s/<[^>]*>//g;p;}' < bloocommod.txt > bloocmdout.txt
  grep  -o 'bbl. [0-9]*.....[0-9]*' bloocmdout.txt > 2cow
echo "Crude 2cow " >cmdout
  numoil=$(tr "bbl.  [[:space:]]*" " " < 2cow )
  echo troil  "$numoil" 
 numoil=$(grep -o  'bbl.  [[:space:]]*' < 2cow )
 
numoil=$(printf "%'.4f" $numoil)
echo oil  "$numoil" 
grep  -o 'MMBtu  [0-9]*.....[0-9]*' bloocmdout.txt >> 2cow
grep  -o 't oz\. [0-9]*.....[0-9]*' bloocmdout.txt >> 2cow

 xcowsay -t 0 --image /mnt/sda11/slimjet_amd64-17.0.9.0.tar.xz.extracted/slimjet/product_logo_128.png <2cow 
 WTI Crude Oil 