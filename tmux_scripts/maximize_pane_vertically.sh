#!/usr/bin/env bash

# https://github.com/tomskopek/tmux-maximize-vertically

main() {
  local all_panes="$(tmux list-pane -F "active:#{pane_active};is_bottom:#{pane_at_bottom}")"
  local active_pane=`echo "$all_panes" | grep active:1`
  local active_bottom_pane=`echo "$active_pane" | sed -e 's,active:1;is_bottom:,,g'`

  if [ "$active_bottom_pane" == "1" ]
  then
    tmux resize-pane -U 60
  else
    tmux resize-pane -D 60
  fi
}
main
