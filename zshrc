# Add ruby Binstubs to our path (must have priority over the rbenv shims!)
export PATH=./bin:$PATH

# add personal bins to path
export PATH=~/bin:$PATH

# add the postgres.app CLI tools
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Emacs style
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
# Vi style:
bindkey -M vicmd v edit-command-line

export EDITOR=nvim
export VISUAL=nvim

source /opt/homebrew/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

eval "$(rbenv init - zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

[[ $- = *i* ]] && source ~/.liquidprompt/liquidprompt

alias ls='ls --color'
alias lt='ls -ltrha --color'
alias la='ls -a --color'

# do this stuff only if we have the GNU coreutils installed
if [[ -s /opt/homebrew/bin/gls ]]
then
  alias ls='/opt/homebrew/bin/gls --color -F'
fi

alias gs='git status'
alias gp='git push'
alias gc='git commit'

alias be='bundle exec'

# start a web server in current directory
alias server='ruby -run -e httpd . -p5000'

# Get the expected md5sum output from the OS X tool...
alias md5='md5 -r'
alias md5sum='md5 -r'

# find procs
psg () {
  ps axo pid,ppid,user,command | grep -i "$*"
}

# initialize zsh completions
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

