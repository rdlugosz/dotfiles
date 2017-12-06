# add the postgres.app CLI tools
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"

# add the rust lang CLI tools
export PATH="$HOME/.cargo/bin:$PATH"

# Add ruby Binstubs to our path (must have priority over the rbenv shims!)
export PATH="./bin:$PATH"

# add Homebrew sbin to path
export PATH="/usr/local/sbin:$PATH"

if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

# vim:set ft=sh et sw=2 foldmethod=marker:
