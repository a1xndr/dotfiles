#!/bin/bash
dunst &
xmodmap .xmodmap &
xset -b &
xrdb ~/.Xdefaults &
xrandr --output LVDS1 --auto --primary
xrandr --output VGA1 --auto --right-of LVDS1
xsetroot -cursor_name "OpenZone White Slim" &
xsetroot -cursor_name left_ptr&
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
feh --bg-fill ~/Pictures/wallpapers/wallhaven-245387.jpg
xsetroot -solid '#2b303b' &
sxhkd &
exec bspwm 
