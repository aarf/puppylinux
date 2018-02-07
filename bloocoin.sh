#!/bin/sh
cd /tmp
rm bloocoin.txt test1 test2
#rm bloocoin.txt blooout3.txt blooout2.txt blooout.txt
#wget -4c "https://coinmarketcap.com/coins/" --output-document=coin.txt 

curl  "https://www.bloomberg.com/markets/currencies/asia-pacific" --output bloocoin.txt 
 #sed -e 's/bitcoin\(.*\)$/\1/' < coin.txt > out.txt
 sed -n '/^$/!{s/<[^>]*>//g;p;}' < bloocoin.txt > blooout.txt
 #grep "€" < blooout.txt > blooout2.txt
 #sed -n '/Zimbabwean Dollar/,/2 Day/p' blooout2.txt > blooout3.txt
 #sed -e 's/"Zimbabwean Dollar"\(.*\)"2 Day"/\1/' < blooout2.txt > blooout3.txt
 #${string%$searchstring*}
 #<img class="sparkline" alt="sparkline" src="https://files.coinmarketcap.com/generated/sparklines/1.png">
  grep  -o 'EUR\"\:{\"USD\":[0-9].[0-9]*' bloocoin.txt > test
echo "EUR-USD " >test1
 #tr "EUR\"\:\{\"USD\"\:       " " " < test >>test1
 numeur=$(tr "EUR\"\:\{\"USD\":[[:space:]]*" " " < test )
 #numeur=$(grep -o  'EUR\"\:\{\"USD\":[[:space:]]*'  test )
numeur=$(printf "%'.4f" $numeur)
echo eur "$numeur" 
#$(echo "$numeur") >> test2
printf "EUR-USD      $numeur">>test2
#tr "\n" " " < test1 >> test2
printf " \r">>test2

 grep  -o 'AUD-USD[[:space:]]*[0-9].[0-9]*' blooout.txt >>test2
 numaud=$(grep  -o 'AUD-USD[[:space:]]*[0-9].[0-9]*' blooout.txt)
echo $numaud

numaud=$(echo "$numaud" | grep  -o '[0-9].[0-9]*' )
echo $numaud
 numaud=$(printf "%'.4f" $numaud)

#printf " \r">>test2
grep  -o 'USD-THB[[:space:]]*[0-9][0-9].[0-9]*' blooout.txt >>test2
numthb=$(grep  -o 'USD-THB[[:space:]]*[0-9][0-9].[0-9]*' blooout.txt)

numthb=$(echo "$numthb" | grep  -o '[0-9][0-9].[0-9]*' )
#audthb=$(("$numthb" * "$numaud"))

#audthb=$(echo |awk '{ print "$numthb"*"$numaud"}') | bc
#echo "$numthb * $numaud" | bc -l > ou
audthb=$(echo "$numthb * $numaud" | bc -l )
audthb=$(printf "%'.4f" $audthb)
#audthb=$(printf |awk '{ printf $numthb * $numaud}')
echo "$audthb"
printf "AUD-THB      $audthb">>test2
#echo "$numthb*$numaud"
#numeur=$(tr "EUR\"\:\{\"USD\":[[:space:]]*" " " < test )
eurthb=$(echo "$numthb * $numeur" | bc -l )
eurthb=$(printf "%'.4f" $eurthb)
printf " \r">>test2
printf "EUR-THB      $eurthb">>test2
xcowsay -t 15  --image /root/blomkt.jpg < test2

