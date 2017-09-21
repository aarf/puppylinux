 #!/bin/sh
 
 activeOutput=$(xrandr | grep -e " connected [^(]" | sed -e "s/\([A-Z0-9]\+\) connected.*/\1/")

 xrandr --output $activeOutput --brightness .35000000000000000000
