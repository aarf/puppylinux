#!/bin/sh

#enter login and password 
login=""
pass=""
xdotool getactivewindow
#xdotool type [TAB]
#xdotool keydown key Tab; sleep 1; xdotool keyup Tab
#xdotool keydown key Tab; sleep 1; xdotool keyup Tab

xdotool sleep 0.3 type --clearmodifiers "$login"
xdotool keydown key Tab; sleep 1; xdotool keyup Tab
#xdotool  type [TAB]
xdotool sleep 0.3 type --clearmodifiers "$pass"
#xdotool keydown key Tab; sleep 1; xdotool keyup Tab
#xdotool keydown key Tab; sleep 1; xdotool keyup Tab
xdotool keydown key Tab; sleep 1; xdotool keyup Tab
xdotool click 
xdotool keydown key KP_Enter; sleep 1; xdotool keyup KP_Enter