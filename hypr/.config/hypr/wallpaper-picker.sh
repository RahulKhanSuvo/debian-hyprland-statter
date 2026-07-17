#!/usr/bin/env bash
dir="$HOME/Pictures/wallpapers"
pidof hyprpaper >/dev/null || hyprpaper &>/dev/null & disown
selected=$(ls "$dir" | wofi --dmenu -p "Wallpaper")
[ -z "$selected" ] && exit 0
hyprctl hyprpaper wallpaper "HDMI-A-1,$dir/$selected"
