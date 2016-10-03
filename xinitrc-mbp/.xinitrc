#!/bin/bash
GTK_THEME=arc:dark
xset -b &
xrdb ~/.Xdefaults &
xrandr --dpi 140 &
#xrandr --output eDP1 --auto
#xrandr --output DP1 --mode 1680x1050 --left-of eDP1 
#xrandr --output DP2 --auto --left-of DP1 --rotate left
sh ~/screens.sh
#xrandr --output LVDS1 --auto --primary
#xrandr --output DP1 --auto --left-of eDP1
#xrandr --output HDMI3 --scale 2x2 --mode 1280x1024  --fb 4160x1800 --pos 2880x0
xsetroot -cursor_name "OpenZone White Slim" &
xsetroot -cursor_name left_ptr&
#xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
#xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
#xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
feh --bg-fill ~/Pictures/wallpapers/wallhaven-245387.jpg
xsetroot -solid '#2b303b' &
sxhkd &
exec bspwm 
