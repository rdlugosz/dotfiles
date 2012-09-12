# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="bira"
#ZSH_THEME="blinks"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew gem)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Pick up path, etc from .profile
. ~/.profile

# shows me all files a folders when I change directories
cd() { builtin cd "$@"; ls}

# custom aliases
alias lt='ls -ltrah'
alias la='l'
alias gs='gss'
alias gd='git diff'
alias be='bundle exec'
alias less='less -r'

# instant mashed potatos
alias server='open http://localhost:8000 && python -m SimpleHTTPServer'

# Init rbenv
eval "$(rbenv init -)"

# add this variable per the brew recipe for byobu...
export BYOBU_PREFIX=`brew --prefix`

