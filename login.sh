#!/bin/sh
login=""
pass=""
xdotool getactivewindow


xdotool keydown key Tab; sleep .3; xdotool keyup Tab
xdotool keydown key Tab; sleep .3; xdotool keyup Tab

xdotool sleep 0.3 type --clearmodifiers "$login"
xdotool keydown key Tab; sleep .4; xdotool keyup Tab
#xdotool  type [TAB]
xdotool sleep 0.3 type --clearmodifiers "$pass"
xdotool keydown key Tab; sleep .3; xdotool keyup Tab
xdotool keydown key Tab; sleep .3; xdotool keyup Tab
xdotool keydown key Tab; sleep ,3; xdotool keyup Tab
#xdotool click 
xdotool keydown key KP_Enter; sleep ,3; xdotool keyup KP_Enter
