#!/bin/sh


codeselect=`Xdialog --stdout --clear --title "Choose code to type" \
        --menubox "Hi, select your choice. The code will be typed in default browser:" 20 131 4 \
       "http://bkhome.org/news/" "bk" \
        "http://distro.ibiblio.org/puppylinux/ " "puppy" \
       "http://puppylinux.org/wikka/RecentChanges" "wikka"  \
        "http://blog.puppylinux.com/" "blog" \
        "http://distro.ibiblio.org/quirky/quirky6/amd64/releases/"  "quirky" \
        "http://woof-ce.26403.n7.nabble.com/"  "woof-ce" \
        "http://distro.ibiblio.org/fatdog/"  "fatdog" \
        "http://www.lightofdawn.org/blog/?viewCat=Fatdog64"  "james" `  
        

echo code is $codeselect

#/mnt/sda12/opera-12.16-1860.x86_64.linux/opera "$codeselect"
defaultbrowser "$codeselect"