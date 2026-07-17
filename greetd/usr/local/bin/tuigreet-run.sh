#!/bin/sh
exec tuigreet \
  --remember \
  --remember-session \
  --time \
  --time-format "%a %b %d  %I:%M %p" \
  --asterisks \
  --theme 'container=darkgray;border=blue;text=white;time=cyan;prompt=magenta;input=white;action=blue;button=magenta;greet=cyan;title=magenta'
