#!/bin/sh
activeOutput=$(xrandr | grep -e " connected [^(]" | sed -e "s/\([A-Z0-9]\+\) connected.*/\1/")
echo $activeOutput
#eDp1 in tahrpup64-604
alpha=`yad --scale --title "Brightness" --text "Move and OK" --min-value=10 --max-value=100 --value=45`
alpha=`echo $alpha / 100 | bc -l`
`xrandr --output $activeOutput --brightness $alpha`
