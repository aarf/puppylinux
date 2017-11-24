#!/bin/sh
#curver=$(wget -4c https://www.slimjet.com/en/dlpage.php  | grep -o 'Stable Version (*)' )
wget -4c https://www.slimjet.com/en/dlpage.php 

RegExStr="<h3*h3>"
#curver=$(grep -o '<h3 >S.*.h3>' "dlpage.php") 
#curver=$(grep -o 'Stable.*.h3' "dlpage.php") 
curver=$(grep -o 'Stable.*.h3' "dlpage.php" | cut -d'(' -f 2 | cut -d')' -f 1 ) 
 #found=$(echo -e "$found" | tail -n 2 )

curver=$(echo -e "$curver" | tail -n 1 )
#egrep -o $RegExStr "dlpage.php" > tezt.txt
echo "$curver"
mv slimjet_amd64.tar.xz slimjet_amd64-$curver.tar.xz
rm dlpage.php
