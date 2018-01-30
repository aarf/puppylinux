#!/bin/sh
 #go(){ echo fish; } ; go ; go ; go 
 
 #go(){ /usr/local/bin/xmessage "fish";} ; go ; go ; go 
 
 #go(){ /usr/local/bin/xmessage "${xclip -o}"} ; go ; go ; go 
 
 #go(){ /usr/local/bin/xmessage<<{xclip -o}} ; go ; go ; go 
 
 #/usr/local/bin/xmessage "fish"
 
 go(){ yaf-splash -bg lightgreen -fg black  -fontsize  x-large -placement center -timeout 2 -text "fatdog";} ; go ; go ; go 