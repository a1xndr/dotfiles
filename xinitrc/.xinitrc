#!/bin/bash
xset -b &
xrdb ~/.Xdefaults &
xrandr --output LVDS1 --auto --primary
xrandr --output VGA1 --auto --right-of LVDS1
xsetroot -cursor_name "OpenZone White Slim" &
xsetroot -cursor_name left_ptr&
xsetroot -solid '#2b303b' &
feh --randomize --bg-fill ~/Pictures/wallpapers/shishkin/*
sxhkd &
exec bspwm 
