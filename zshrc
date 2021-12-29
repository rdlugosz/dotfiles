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

alias ls="gls --color"
alias lt="gls -ltrha --color"
alias la="gls -a --color"

alias gs="git status"
alias gp="git push"
alias gc="git commit"

