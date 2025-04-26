# To profile startup time, uncomment this line and the corresponding line at the bottom
# zmodload zsh/zprof

# Add ruby Binstubs to our path (must have priority over the rbenv shims!)
export PATH=./bin:$PATH

# add personal bins to path
export PATH=~/bin:$PATH

# add the postgres.app CLI tools
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# Android development stuff
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH

# Required for some gems to build native extensions (like PG gem)
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/libpq/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libpq/include"
export GRPC_PYTHON_BUILD_SYSTEM_OPENSSL=1
export GRPC_PYTHON_BUILD_SYSTEM_ZLIB=1
export GRPC_PYTHON_BUILD_SYSTEM_CARES=1

# history settings
export HISTFILE=~/.zhistory
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T] "
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS

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

[[ -f /opt/homebrew/bin/rbenv ]] && eval "$(rbenv init - zsh)"

export NVM_DIR="$HOME/.nvm"
# [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# FZF Stuff
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# Use the pspg pager for psql, if installed
if [[ -s /opt/homebrew/bin/pspg ]]
then
  export PSQL_PAGER="pspg --style=17"
fi

# on linux
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh

# on my mac...
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
[ -f /usr/share/autojump/autojump.sh ] && . /usr/share/autojump/autojump.sh
# FZF integration with autojump
j() {
    if [[ "$#" -ne 0 ]]; then
        cd $(autojump $@)
        return
    fi
    cd "$(autojump -s | sort -k1gr | awk '$1 ~ /[0-9]:/ && $2 ~ /^\// { for (i=2; i<=NF; i++) { print $(i) } }' |  fzf --height 40% --reverse --inline-info)"
}

function alias_if_missing() {
  if ! (whence -w "$1" >/dev/null 2>&1); then
    alias "$1"="$2"
  fi
}

#alias_if_missing bat 'cat'

# MacOS doesn't have a built in watch command, so this is an approximation

fakewatch () { while true; do DATE=$(date); RESULT=$(${@}); clear; echo "$DATE"; echo "$RESULT"; sleep 2; done; }
alias_if_missing watch 'fakewatch'

# expand-and-accept-alias() {
#     zle expand-word        # Expand the current word (alias)
#     zle self-insert        # Insert a space
# }
# zle -N expand-and-accept-alias
# bindkey ' ' expand-and-accept-alias

alias ll='ls -lah'
alias lt='ls -ltrha'
alias la='ls -a'

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
alias gl='git log --oneline --graph --parents -n 9'
alias gsm='git switch main'

alias be='bundle exec'

alias dcew='docker compose exec -it web'

# start a web server in current directory
alias server='ruby -run -e httpd . -p5000'

# Get the expected md5sum output from the OS X tool...
alias md5='md5 -r'
alias md5sum='md5 -r'

# We use neovim if available
if [[ -s /opt/homebrew/bin/nvim ]]
then
  alias vim='/opt/homebrew/bin/nvim'
fi

# Only on MacOS, set an alias for tailscale
if [[ -f /Applications/Tailscale.app/Contents/MacOS/Tailscale ]]
then
  alias tailscale=/Applications/Tailscale.app/Contents/MacOS/Tailscale
fi

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

# Set a fast prompt
PS1='%F{blue}%~ %(?.%F{green}.%F{red})%#%f '

# Set a more interesting prompt if available
[[ -f /opt/homebrew/bin/starship || /home/linuxbrew/.linuxbrew/bin/starship ]] && eval "$(starship init zsh)"

autoload -Uz compinit
compinit

if [[ -f /home/linuxbrew/.linuxbrew/bin/brew ]]
then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# zprof
