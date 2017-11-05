#!/bin/sh
newname=$(grep "SUMMARY" vCalendar.vcs)
echo $newname
last=".vCalendar.vcs"
#find position of : then truncate before it
newname="$newname" | tr -cd [:print:] | tr -d ":"
newname=${newname#*:}
echo $newname

size=${#newname}
size=$size
echo $size
newname3=${newname:0:$size}

echo  $newname3
newname3=${newname3%=*}
#newnam3=$(echo $newname3 | sed 's/=0A//')
newname3=${newname3/=0A/ }
newname3=${newname3/=0A/ }
newname3=${newname3/=3D/= }
newname3=${newname3/\//- }
newname4="${newname3}""$last"
echo $newname4

mv vCalendar.vcs "/root/received-files/Calendar/$newname4"

#errata follows
#poition=
#position=("$newname" | grep -aob '='--color=never | \grep -oE '^[0-9]+')
#echo "pos" $position
#newname2=$(sed '$newname/:.*//')
#newname2=$(sed '$newname/=.*//')

#echo "nn2" $newname2
#newname3=${newname:8}
#echo $newname3
