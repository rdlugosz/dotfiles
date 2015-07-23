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

if (( $+commands[pmset] )) ; then
  battery="$(pmset -g ps | awk 'NR==2' | perl -pe 's/.*?(\d+)%.*/\1/')"

  if [[ $battery -lt 25 ]]; then
    echo "#[blink]❤ #[noblink]♡ ♡ "
  elif [[ $battery -lt 50 ]]; then
    echo "❤ ♡ ♡ "
  elif [[ $battery -lt 75 ]]; then
    echo "❤ ❤ ♡ "
  else
    echo "❤ ❤ ❤ "
  fi
fi
