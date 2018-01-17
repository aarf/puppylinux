#!/bin/sh
#sometext="frog"
sometext=`cat "/root/fatdog test changett.txt"`
cat << EOF > /tmp/editbox.tmp.$$
$sometext


EOF

Xdialog --title "EDIT BOX" --fixed-font --print "" \
	--editbox /tmp/editbox.tmp.$$ 24 75 2>"/root/fatdog test changett.txt" #/tmp/editbox.txt.$$

case $? in
  0)
    cat /tmp/editbox.txt.$$
    echo "OK"
    ;;
  1)
    echo "Cancel pressed."
    ;;
  255)
    echo "Box closed."
    ;;
esac

rm -f /tmp/editbox.tmp.$$
#rm -f /tmp/editbox.txt.$$

