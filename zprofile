# The following lines were added by Docker Desktop to add commands to your PATH.
export PATH="$PATH:/Users/ryan/.docker/bin"
# End of Docker Desktop section.

if [[ -f /opt/homebrew/bin/brew ]]
then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [[ -f /home/linuxbrew/.linuxbrew/bin/brew ]]
then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

