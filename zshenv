# ~/.zshenv is read by EVERY zsh, including the non-interactive, non-login
# shells that sshd spawns for remote commands (mosh-server, scp, rsync,
# editor remote plugins). Those shells never see .zprofile or .zshrc, so
# anything that must be on PATH for a remote command has to be set here.
#
# Keep this file minimal and fast: no prompts, no completions, no aliases.

# Homebrew (macOS and Linuxbrew). `brew shellenv` is idempotent, so it's
# fine that .zprofile runs it again after macOS's path_helper reorders PATH.
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# uv, pipx, and other user-local tools
[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"
