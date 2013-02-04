# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

if [[ -d $ZSH ]]
then
  ZSH_THEME="robbyrussell"
  plugins=(git bundler gem heroku rails3 rvm tmux)

  [[ `uname` = 'Darwin' ]] && plugins+=(osx brew)

  source $ZSH/oh-my-zsh.sh

  #Tweak the robbyrussell theme prompt
  PROMPT='%{$fg[red]%}%n@%m %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}%# % %{$reset_color%}'
else
  echo 'PLEASE INSTALL OH MY ZSH (git clone git@github.com:robbyrussell/oh-my-zsh ~/.oh-my-zsh)'
fi

# Pick up path, etc from .profile
[[ -s ~/.profile ]] && . ~/.profile

# Pull in the OS X stuff if we're on that platform
[[ `uname` = 'Darwin' ]] && . ~/.zshrc.osx

# Pull in Linux stuff if we're on that platform
[[ `uname` = 'Linux' ]] && . ~/.zshrc.linux

# universal aliases
alias lt='ls -ltrah'
alias la='l'
alias be='bundle exec'
alias less='less -r'
