#!/usr/bin/env zsh
#
# Works best with blinking text: the last heart will blink when you have less
# than 25% of your battery life remaining.
#
# adapted from: https://gist.github.com/4324139
#
# Add the following to your `~/.tmux.conf`;
#
#     set -g status-right "#[fg=red]#(path/to/zelda-battery-tmux.sh) "

# Character reference
# (to enter in Vim: C-v u####)
# unicode - symbol
# U+2665  - ♥
# U+2661  - ♡
# U+2764  - ❤
# 
# Note: we've played with using actual emoji chars in here, but it is
# finicky in terms of how it is displayed in width. Also, some of the
# emoji unicode codes collide with existing symbols in the font & that
# version is displayed instead of the one from the emoji font. Unclear
# if this is just the way it is or if we're doing something wrong.

if (( $+commands[pmset] )) ; then
  battery="$(pmset -g ps | awk 'NR==2' | perl -pe 's/.*?(\d+)%.*/\1/')"
  full=❤
  empty=♡

  if [[ $battery -lt 20 ]]; then
    echo "#[blink] $full #[noblink] $empty $empty $empty"
  elif [[ $battery -lt 25 ]]; then
    echo "$full $empty $empty $empty"
  elif [[ $battery -lt 50 ]]; then
    echo "$full $full $empty $empty"
  elif [[ $battery -lt 75 ]]; then
    echo "$full $full $full $empty"
  else
    echo "$full $full $full $full"
  fi
fi
