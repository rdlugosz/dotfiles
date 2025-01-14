# add the postgres.app CLI tools
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"

# add the rust lang CLI tools
export PATH="$HOME/.cargo/bin:$PATH"

# add Homebrew to path
export PATH="/usr/local/sbin:/usr/local/bin:$PATH"

# add Linuxbrew to path
if [ -d /home/linuxbrew ]; then
  export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
fi

# Add ruby Binstubs to our path (must have priority over the rbenv shims!)
export PATH="./bin:$PATH"

# add personal bins to path
export PATH="~/bin:$PATH"


### Disable CTRL-S and CTRL-Q
[[ $- =~ i ]] && stty -ixoff -ixon

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

# Merge tool for Rails
export THOR_MERGE='code -d $1 $2'

export ANDROID_HOME=~/Library/Android

[ -z "$TMPDIR" ] && TMPDIR=/tmp

[[ -s /usr/local/bin/gdircolors ]] && eval `/usr/local/bin/gdircolors ~/.dircolors-solarized/dircolors.ansi-universal`

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

alias ls='ls --color=auto'
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
if [[ -s /opt/homebrew/bin/gls ]]
then
  alias ls='/opt/homebrew/bin/gls --color -F'
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
if which rbenv > /dev/null; then eval "$(rbenv init - --no-rehash)"; fi

# heroku autocomplete setup
HEROKU_AC_BASH_SETUP_PATH=/Users/ryan/Library/Caches/heroku/autocomplete/bash_setup && test -f $HEROKU_AC_BASH_SETUP_PATH && source $HEROKU_AC_BASH_SETUP_PATH;

# configure autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

if [ -f "$(command -v rg)" ]; then
  export FZF_DEFAULT_COMMAND='rg --files --no-messages'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

# configure fzf hooks if installed
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

### Append to the history file
# https://unix.stackexchange.com/questions/18212/bash-history-ignoredups-and-erasedups-setting-conflict-with-common-history
shopt -s histappend
HISTCONTROL=ignoreboth:erasedups
HISTSIZE=10000
HISTFILESIZE=100000
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"


# vim:set ft=sh et sw=2 foldmethod=marker:
