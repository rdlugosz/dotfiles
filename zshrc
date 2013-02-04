# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

if [[ -d $ZSH ]]
then
  ZSH_THEME="robbyrussell"
  DISABLE_AUTO_TITLE="true"
  plugins=(git bundler gem heroku rails3 rvm tmux)

  [[ `uname` = 'Darwin' ]] && plugins+=(osx brew)

  source $ZSH/oh-my-zsh.sh
else
  echo 'PLEASE INSTALL OH MY ZSH (git clone git@github.com:robbyrussell/oh-my-zsh ~/.oh-my-zsh)'
fi

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

# custom aliases
alias lt='ls -ltrah'
alias la='l'
alias gs='git status -sb'
alias gd='git diff'
alias be='bundle exec'
alias less='less -r'

# Get the expected md5sum output from the OS X tool...
alias md5='md5 -r'
alias md5sum='md5 -r'

# instant mashed potatos
alias server='open http://localhost:8000 && python -m SimpleHTTPServer'

alias mysql_load="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
alias mysql_unload="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
alias postgres_load="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias postgres_unload="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"

# Init rbenv
eval "$(rbenv init -)"

#Tweak the robbyrussell theme prompt
PROMPT='%{$fg[red]%}%n@%m %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}%# % %{$reset_color%}'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# setup fasd
# https://github.com/clvv/fasd
eval "$(fasd --init auto)"
alias v='f -t -e vim -b viminfo'
