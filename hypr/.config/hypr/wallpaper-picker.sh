#!/usr/bin/env bash
dir="$HOME/Pictures/wallpapers"

if [ ! -t 0 ]; then
  exec kitty --class wallpaper-picker -e "$0"
fi

pidof hyprpaper >/dev/null || hyprpaper &>/dev/null & disown

selected=$(ls "$dir" | fzf --preview='kitty icat --clear --transfer-mode=memory --stdin=no '"$dir"'/{}' --preview-window='right:50%,border-rounded' --prompt='Wallpaper > ')
[ -z "$selected" ] && exit 0
hyprctl hyprpaper wallpaper ",$dir/$selected"
