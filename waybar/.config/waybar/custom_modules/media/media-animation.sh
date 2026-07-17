#!/usr/bin/env bash

frames=("▂▄▆" "▄▂▆" "▄▆▂" "▆▄▂" "▆▂▄")

trap "exit 0" PIPE

while true; do
    status=$(playerctl status 2>/dev/null)

    for frame in "${frames[@]}"; do
        if [ "$status" = "Playing" ]; then
            printf '%s\n' "$frame" 2>/dev/null
        elif [ "$status" = "Paused" ]; then
            printf '\n' 2>/dev/null
        else
            printf '\n' 2>/dev/null
        fi
        sleep 0.1
    done
done
