#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
# see: https://github.com/sorin-ionescu/prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Pull in the OS X stuff if we're on that platform
[[ `uname` = 'Darwin' ]] && . ~/.zshrc.osx

# Pull in Linux stuff if we're on that platform
[[ `uname` = 'Linux' ]] && . ~/.zshrc.linux

# universal aliases
alias lt='ls -ltrah'
alias la='l'
alias be='bundle exec'

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

# find procs
# cannot directly use an alias because zsh doesn't support arguments
psg () { ps axo pid,ppid,user,command | grep -i "$*" }

# use ctrl-z to toggle suspension (great with Vim!)
# http://goo.gl/UVOlgo
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# execute local rc if it exists
if [[ -e $HOME/.zshrc.local ]]; then
  source $HOME/.zshrc.local
fi
