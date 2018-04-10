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
 #tr "\n" " " < out3.txt > output4.txt
 tr "\n" "@ " < out3.txt > output4.txt
 tr -d '[:space:]' < output4.txt > output5.txt
tr "@" " " < output5.txt > output6.txt
#tr " " "\n" < output6.txt > output7.txt
#wget -4c "https://files.coinmarketcap.com/generated/sparklines/1.png"
#wget  -4c https://s2.coinmarketcap.com/generated/sparklines/1.png
wget  -4c https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1.png
#xcowsay -t 9 --image /root/btcimage.jpeg < output6.txt
gm composite 1.png /root/black.png  combined.png

xcowsay -t 9 --left --image combined.png < output6.txt
