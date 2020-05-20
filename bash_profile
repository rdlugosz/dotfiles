if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

### Check the window size after each command ($LINES, $COLUMNS)
shopt -s checkwinsize

shopt -s cdspell
if (( BASHVERSINFO[0] >= 4 )); then
  shopt -s direxpand
  shopt -s dirspell
fi

# if this is an interactive terminal, set some completion config
if [ -t 1 ]
then
  bind 'TAB:menu-complete'
  # some other completion-related stuff lives in .inputrc
fi

# vim:set ft=sh et sw=2 foldmethod=marker:
