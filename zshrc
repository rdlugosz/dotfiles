# Fig pre block. Keep at the top of this file.
. "$HOME/.fig/shell/zshrc.pre.zsh"

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

[[ $- = *i* ]] && source ~/.liquidprompt/liquidprompt

eval "$(rbenv init - zsh)"

# FZF Stuff
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
# FZF integration with autojump
j() {
    if [[ "$#" -ne 0 ]]; then
        cd $(autojump $@)
        return
    fi
    cd "$(autojump -s | sort -k1gr | awk '$1 ~ /[0-9]:/ && $2 ~ /^\// { for (i=2; i<=NF; i++) { print $(i) } }' |  fzf --height 40% --reverse --inline-info)"
}

alias ls='ls --color'
alias ll='ls -lh --color'
alias lt='ls -ltrha --color'
alias la='ls -a --color'

alias x='exa --long --grid'
alias xl='exa --long' # don't use the grid here as it hides link destination
alias xa='exa --long --grid -a'
alias xt='exa --long --sort newest -a'
alias xg='exa --long --git'

# do this stuff only if we have the GNU coreutils installed
if [[ -s /opt/homebrew/bin/gls ]]
then
  alias ls='/opt/homebrew/bin/gls --color -F'
fi

alias gs='git status'
alias gp='git push'
alias gc='git commit'
alias gd='git diff'

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
# Allow for more flexibility with things like Case
zstyle ':completion:*' matcher-list '' '+m:{a-zA-Z}={A-Za-z}' '+r:|[._-]=* r:|=*' '+l:|=* r:|=*'

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  FPATH="$(brew --prefix)/share/zsh-completions:$FPATH"
fi

autoload -Uz compinit
compinit

# Fig post block. Keep at the bottom of this file.
. "$HOME/.fig/shell/zshrc.post.zsh"
