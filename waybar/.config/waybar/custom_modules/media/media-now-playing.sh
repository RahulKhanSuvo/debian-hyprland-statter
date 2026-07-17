#!/usr/bin/env bash

while true; do
    text=$(playerctl metadata --format '{{title}} - {{artist}}' 2>/dev/null)

    if [ -z "$text" ]; then
        echo "" 2>/dev/null
        sleep 1
        continue
    fi

    scroll="$text     "

    while true; do
        current=$(playerctl metadata --format '{{title}} - {{artist}}' 2>/dev/null)
        if [ "$current" != "$text" ]; then
            break
        fi
        for ((i=0; i<${#scroll}; i++)); do
            echo "${scroll:i:20}" 2>/dev/null
            sleep 0.2
        done
        scroll="$scroll$text     "
    done
done
