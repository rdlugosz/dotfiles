# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="blinks"

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
plugins=(git brew bundler terminalapp)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Pick up path, etc from .profile
. ~/.profile

# shows me all files a folders when I change directories
cd() { builtin cd "$@"; ls}

# custom aliases
alias lt='ls -ltrah'
alias la='l'
alias gs='git status'
alias gd='git diff'
alias m='mate'

# Tweak the robbyrussell theme prompt
# PROMPT='%{$fg[red]%}%n@%m %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}%# % %{$reset_color%}'

# RVM Stuff
[[ -s "/Users/ryan/.rvm/scripts/rvm" ]] && source "/Users/ryan/.rvm/scripts/rvm"  # This loads RVM into a shell session.