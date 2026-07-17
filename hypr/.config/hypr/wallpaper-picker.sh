#!/usr/bin/env bash
dir="$HOME/Pictures/wallpapers"
pidof hyprpaper >/dev/null || hyprpaper &>/dev/null & disown
selected=$(ls "$dir" | fzf --prompt='Wallpaper > ')
[ -z "$selected" ] && exit 0
hyprctl hyprpaper wallpaper ",$dir/$selected"
