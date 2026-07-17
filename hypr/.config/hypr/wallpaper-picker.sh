#!/usr/bin/env bash
dir="$HOME/Pictures/wallpapers"
pidof hyprpaper >/dev/null || hyprpaper &>/dev/null & disown

selected=$(find "$dir" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' \) \
  | fzf --preview 'kitty icat --clear --transfer-mode=memory --stdin=no --place=${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}@0x0 {}' \
        --preview-window 'right:60%:noborder')

[ -z "$selected" ] && exit 0
hyprctl hyprpaper wallpaper ",$selected"
