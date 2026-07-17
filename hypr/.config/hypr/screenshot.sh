#!/usr/bin/env bash
file=$(mktemp /tmp/screenshot-XXXXXX.png)
grim -g "$(slurp)" "$file" && swappy -f "$file"
rm -f "$file"
