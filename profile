
#export PATH=/usr/local/mysql/bin:/usr/local/bin:/usr/local/sbin:$HOME/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

# Add mysql lib path so that things which need it can find it..
# http://goo.gl/tJnVN
export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"

#make TextMate the default editor
export EDITOR=/Users/ryan/bin/mate.sh
