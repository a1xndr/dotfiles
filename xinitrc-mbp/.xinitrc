#!/bin/sh
sleep 5
xrandr --output eDP-1 --auto --output DP-1 --auto --panning $[1280*2]x$[1024*2]+2880+0 --scale 2x2 --right-of eDP-1 &
xset -b &
xrdb ~/.Xdefaults &
xsetroot -cursor_name "OpenZone White Slim" &
xsetroot -cursor_name left_ptr&
xsetroot -solid '#2b303b' &
sxhkd &
exec bspwm 
