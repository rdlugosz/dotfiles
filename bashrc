### Append to the history file
shopt -s histappend

### Check the window size after each command ($LINES, $COLUMNS)
shopt -s checkwinsize

shopt -s cdspell
shopt -s direxpand
shopt -s dirspell

### Disable CTRL-S and CTRL-Q
[[ $- =~ i ]] && stty -ixoff -ixon

export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=10000

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

[ -z "$TMPDIR" ] && TMPDIR=/tmp

[[ -s /usr/local/bin/gdircolors ]] && eval `gdircolors ~/.dircolors-solarized/dircolors.ansi-universal`

alias lt='ls -ltrah'
alias la='ls -a'
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

# add the postgres.app CLI tools
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# add the rust lang CLI tools
export PATH="$HOME/.cargo/bin:$PATH"

if [ -f /usr/local/share/bash-completion/bash_completion ]; then
  . /usr/local/share/bash-completion/bash_completion
fi

# Set up Liquidprompt, only on interactive shells
if [[ $- = *i* ]]; then
  source ~/.liquidpromptrc
  source ~/.liquidprompt/liquidprompt
fi

# set up Ruby shims and autocomplete
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# Add ruby Binstubs to our path (must have priority over the rbenv shims!)
export PATH="./bin:$PATH"

# configure autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh


# vim:set ft=sh et sw=2 foldmethod=marker:
