#!/bin/sh
i=0
output=$(ldd opera48)
output=$( ldd opera48   | cut -d' ' -f 3 ) 

outline[$i]=""
echo -e "$output" | while read -r p; do
(( i++ ))
line[$i]=${p}
echo $i
echo "${line[$i]}"
cp ${line[$i]} /root/x1/${line[$i]}
outline[$i]="${line[$i]}"
#done </root/text1-9.txt

#echo "100zzz" "${line[100]}"
done
#echo ${!outline[@]} 
#echo "100zzz" "${line[100]}"
#echo "100zzz" "${line[100]}"

#echo -e "$output" | while read str ; do
 #   echo /r
   # array[i]=echo "$((++i)): $str"
#done

#echo $array

echo xxx
while read a output ; do
 echo "$((++i)): $output"
echo /r
done
# cp  /lib/libcrypt.so.1  /root/x1/libcrypt.so.1
root# 

