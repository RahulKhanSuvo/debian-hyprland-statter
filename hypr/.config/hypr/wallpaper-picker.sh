#!/usr/bin/env bash
dir="$HOME/Pictures/wallpapers"
selected=$(ls "$dir" | fzf --prompt='Wallpaper > ')
[ -z "$selected" ] && exit 0
killall swaybg 2>/dev/null
swaybg -i "$dir/$selected" -m fill &>/dev/null & disown
