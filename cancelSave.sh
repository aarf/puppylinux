#!/bin/sh

wmpoweroff &

sleep 2

xdotool getactivewindow

xdotool keydown key Tab; sleep 1; xdotool keyup Tab
xdotool keydown key Tab; sleep 1; xdotool keyup Tab

xdotool click 
xdotool keydown key KP_Enter; sleep 1; xdotool keyup KP_Enter
