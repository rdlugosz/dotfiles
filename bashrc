### Append to the history file
shopt -s histappend

### Check the window size after each command ($LINES, $COLUMNS)
shopt -s checkwinsize

shopt -s cdspell
if (( BASHVERSINFO[0] >= 4 )); then
  shopt -s direxpand
  shopt -s dirspell
fi

### Disable CTRL-S and CTRL-Q
[[ $- =~ i ]] && stty -ixoff -ixon

export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=10000
export HISTFILESIZE=100000

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

# if this is an interactive terminal, set some completion config
if [ -t 1 ]
then
  bind 'TAB:menu-complete'
  # some other completion-related stuff lives in .inputrc
fi

[ -z "$TMPDIR" ] && TMPDIR=/tmp

[[ -s /usr/local/bin/gdircolors ]] && eval `gdircolors ~/.dircolors-solarized/dircolors.ansi-universal`

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

alias lt='ls -ltrah'
alias la='ls -a'
alias ll='ls -la'
alias be='bundle exec'

alias grep='grep --color=auto'

# start a web server in current directory
alias server='ruby -run -e httpd . -p5000'

# override alias in the git module (old habits die hard)
alias gs='git status'
alias gc='git commit'
alias gd='git diff'
alias gp='git push'

alias gsv='nvim `git status --porcelain | sed -ne ''s/^ M //p''`'
alias gsgv='mvim `git status --porcelain | sed -ne ''s/^ M //p''`'
alias gsmv='mvim `git status --porcelain | sed -ne ''s/^ M //p''`'

alias lol='lolcat'

alias how='howdoi'

alias dm='docker-machine'

# find procs
psg () {
  ps axo pid,ppid,user,command | grep -i "$*"
}

# Get the expected md5sum output from the OS X tool...
alias md5='md5 -r'
alias md5sum='md5 -r'

alias mysql_load="mysql.server start"
alias mysql_unload="mysql.server stop"
alias postgres_load="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias postgres_unload="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"

# Open deluge-console on the nas
alias deluge='ssh -L 58846:10.10.0.104:58846 -t nas.dlugosz.net "lxc exec deluge deluge-console"'

# Headless Chrome
# https://developers.google.com/web/updates/2017/04/headless-chrome
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

# do this stuff only if we have the GNU coreutils installed
if [[ -s /usr/local/bin/gls ]]
then
  alias ls='/usr/local/bin/gls --color -F'
fi

if (( BASHVERSINFO[0] >= 4 )); then
  if [ -f /usr/local/share/bash-completion/bash_completion ]; then
    . /usr/local/share/bash-completion/bash_completion
  fi
fi

# Set up Liquidprompt, only on interactive shells
if [[ $- = *i* ]]; then
  source ~/.liquidpromptrc
  source ~/.liquidprompt/liquidprompt
fi

# set up Ruby shims and autocomplete
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# configure autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

if [ -f "$(command -v rg)" ]; then
  export FZF_DEFAULT_COMMAND='rg --files --no-messages'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

# configure fzf hooks if installed
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Each time we display the prompt, append to and load new history items
PROMPT_COMMAND="history -a;history -n;$PROMPT_COMMAND"


# vim:set ft=sh et sw=2 foldmethod=marker:
