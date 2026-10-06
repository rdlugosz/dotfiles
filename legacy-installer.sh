#!/usr/bin/env bash
#
# bootstrap installs things.
# original by: https://github.com/holman/dotfiles

DOTFILES_ROOT="`pwd`"

DOTFILES_LIST=(
    agignore
    bash_profile
    bashrc
    dotfiles
    inputrc
    gemrc
    gitconfig
    githelpers
    gitignore_global
    gvimrc
    htoprc
    iftoprc
    irbrc
    psqlrc
    tmux.conf
    vimrc
    dircolors-solarized
    zshrc
    zprofile
  )

set -e

echo ''

info () {
  printf "  [ \033[00;34m..\033[0m ] $1\n"
}

user () {
  printf "\r  [ \033[0;33m?\033[0m ] $1 "
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

link_files () {
  ln -s $DOTFILES_ROOT/$1 $2
  success "linked $1 to $2"
}

# Links under ~/.config, as "source:destination" pairs
CONFIG_LINKS=(
    vimrc:.config/nvim/init.vim
    starship.toml:.config/starship.toml
    alacritty.toml:.config/alacritty/alacritty.toml
  )

install_config_links () {
  info "installing ~/.config links"

  for pair in "${CONFIG_LINKS[@]}"
  do
    source="${pair%%:*}"
    dest="$HOME/${pair#*:}"

    mkdir -p "$(dirname "$dest")"

    if [[ -h $dest ]]; then
      success "$dest link exists"
    elif [[ -e $dest ]]; then
      fail "$dest is a real file, not a link to $source!"
    else
      link_files $source $dest
    fi
  done
}

install_dotfiles () {
  info "installing dotfiles"

  overwrite_all=false
  backup_all=false
  skip_all=false


  for source in "${DOTFILES_LIST[@]}"
  do
    dest="$HOME/.$source"

    if [ -f $dest ] || [ -d $dest ] || [ -L $dest ]
    then

      overwrite=false
      backup=false
      skip=false

      if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
      then
        user "File already exists: `basename $source`, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac
      fi

      if [ "$overwrite" == "true" ] || [ "$overwrite_all" == "true" ]
      then
        rm -rf $dest
        success "removed $dest"
      fi

      if [ "$backup" == "true" ] || [ "$backup_all" == "true" ]
      then
        mv $dest $dest\.backup
        success "moved $dest to $dest.backup"
      fi

      if [ "$skip" == "false" ] && [ "$skip_all" == "false" ]
      then
        link_files $source $dest
      else
        success "skipped $source"
      fi

    else
      link_files $source $dest
    fi

  done
}


install_dotfiles
install_config_links

echo ''
echo '  All installed!'

