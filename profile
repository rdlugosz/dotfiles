
# turns out it is more reliable to export the path to OS X via /etc/paths and /etc/path.d
# otherwise apps (like MacVim) won't get a proper path assigned.
#export PATH=/usr/local/mysql/bin:/usr/local/bin:/usr/local/sbin:$HOME/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
export PATH=$PATH:$HOME/bin

#make MacVim the default editor
export EDITOR='mvimf.sh'
export GIT_EDITOR='/usr/local/bin/vim -f --nomru'

