#!/bin/sh
activeOutput=$(xrandr | grep -e " connected [^(]" | sed -e "s/\([A-Z0-9]\+\) connected.*/\1/")
alpha=`zenity --scale --title "Brightness" --text "Move and OK" --min-value=10 --max-value=100 --value=45`
alpha=`echo $alpha / 100 | bc -l`
echo $activeOutput
echo $alpha
`xrandr --output $activeOutput --brightness $alpha`

#below wont execute until after click anyway so no use 
 #xdotool mousemove x:217 y:195 CLICK 1
 #xdotool click --window getactivewindow 1
#echo xdotool getactivewindow


