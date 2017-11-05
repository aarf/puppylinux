#!/bin/sh
#usages notes
#cannot have / in name, perhaps code to . or -
#cant have same name?
#doesnt work with thai characters in name. so perhaps other non=romans characters too
#works in fatdog720
#goes into /root/received-files/
#click on it after each bluetooth vCard.vcf transfer so that the file isnt overwriten by subsequent vCard transfers
newname=$(grep "FN:" vCard.vcf)
echo $newname
last=".vCard.vcf"
newname3=${newname:3}
size=${#newname}
size=$size-4
echo $size
newname3=${newname:3:$size}

echo  $newname3

newname4="${newname3}""$last"
echo $newname4

mv vCard.vcf "/root/received-files/$newname4"
