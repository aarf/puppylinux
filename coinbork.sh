#!/bin/sh
cd /tmp
rm coin.txt out3.txt out2.txt out.txt
#wget -4c "https://coinmarketcap.com/coins/" --output-document=coin.txt 

curl  "https://coinmarketcap.com/coins/" --output coin.txt 
 #sed -e 's/bitcoin\(.*\)$/\1/' < coin.txt > out.txt
 sed -n '/^$/!{s/<[^>]*>//g;p;}' < coin.txt > out.txt

#sed -e 's/BTC\(.*\)BTC/\1/' < out.txt > out2.txt
sed -n '/Bitcoin/,/BTC/p' < out.txt > out2.txt
#<a href="/currencies/bitcoin/#markets" class="price" data-usd="8682.32" data-btc="1.0" >$8682.32</
head -n 14 < out2.txt > out3.txt
xcowsay < out3.txt
