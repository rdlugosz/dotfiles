#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
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

# override alias in the git module (old habits die hard)
alias gs='git status'
alias gd='git diff'
