#!/bin/sh


codeselect=`Xdialog --stdout --clear --title "Choose code to type" \
        --menubox "Hi, select your choice. The code will be typed in default browser:" 20 131 4 \
       "http://bkhome.org/news/" "image" \
        "http://distro.ibiblio.org/puppylinux/ " "url" \
       "http://puppylinux.org/wikka/RecentChanges" "quote"  \
        "http://blog.puppylinux.com/" "wget" \
        "http://distro.ibiblio.org/quirky/quirky6/amd64/releases/"  "Madafakkar" \
        "http://woof-ce.26403.n7.nabble.com/"  "bash" \
        "http://distro.ibiblio.org/fatdog/"  "code" \
        "http://www.lightofdawn.org/blog/?viewCat=Fatdog64"  "md5sum" `  
        

echo code is $codeselect

#/mnt/sda12/opera-12.16-1860.x86_64.linux/opera "$codeselect"
defaultbrowser "$codeselect"