#!/bin/sh
#
# Zelda-style battery hearts for tmux status line.
# The last heart blinks when battery is below 25%.
# Shows a ⚡ when fully charged on AC power.
#
# adapted from: https://gist.github.com/4324139
#
# Add the following to your `~/.tmux.conf`:
#
#     set -g status-right "#[fg=red]#(path/to/zelda-battery-tmux.sh) "

if ! command -v pmset >/dev/null 2>&1; then
  exit 0
fi

battery="$(pmset -g batt | grep -Eo '[0-9]+%' | head -1 | tr -d '%')"
charging="$(pmset -g batt | grep -c 'AC Power')"

if [ -z "$battery" ]; then
  exit 0
fi

full="♥"
empty="#[fg=colour240]♡#[fg=colour1]"

if [ "$charging" -gt 0 ] && [ "$battery" -ge 99 ]; then
  echo "$full $full $full $full⚡"
elif [ "$battery" -lt 25 ]; then
  echo "#[blink]$full#[noblink] $empty $empty $empty"
elif [ "$battery" -lt 50 ]; then
  echo "$full $full $empty $empty"
elif [ "$battery" -lt 75 ]; then
  echo "$full $full $full $empty"
else
  echo "$full $full $full $full"
fi
