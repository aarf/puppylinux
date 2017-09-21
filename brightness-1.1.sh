 #!/bin/sh
 
 activeOutput=$(xrandr | grep -e " connected [^(]" | sed -e "s/\([A-Z0-9]\+\) connected.*/\1/")
#manually edit the last number to the brightness number you want 1 is max, 0 is lowest brightness
 xrandr --output $activeOutput --brightness .35000000000000000000
