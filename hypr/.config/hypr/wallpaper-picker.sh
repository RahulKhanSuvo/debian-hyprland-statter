#!/usr/bin/env bash
dir="$HOME/Pictures/wallpapers"
selected=$(ls "$dir" | wofi --dmenu -p "Wallpaper")
[ -z "$selected" ] && exit 0
path="$dir/$selected"
hyprctl hyprpaper preload "$path"
hyprctl hyprpaper wallpaper "HDMI-A-1,$path"
