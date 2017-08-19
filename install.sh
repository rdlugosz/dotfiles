#!/usr/bin/env bash
#
# bootstrap installs things.
# original by: https://github.com/holman/dotfiles

DOTFILES_ROOT="`pwd`"

DOTFILES_LIST=(
    agignore
    atom
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
    liquidprompt
    liquidpromptrc
    powconfig
    psqlrc
    slate
    spacemacs
    tmux.conf
    vimrc
    dircolors-solarized
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

setup_nvim_dir () {
  nvim_config_dir=~/.config/nvim
  nvim_vimrc_link="$nvim_config_dir/init.vim"

  info "checking for neovim config link: $nvim_vimrc_link"

  if [[ ! -d $nvim_config_dir ]]; then
    info "creating neovim config directory"
    mkdir -p $nvim_config_dir
  fi

  if [[ ! -e $nvim_vimrc_link ]]; then
    info "linking .vimrc for neovim"
    ln -s $DOTFILES_ROOT/vimrc $nvim_vimrc_link
    if [[ -h $nvim_vimrc_link ]]; then
      success "link created"
    fi
  elif [[ ! -h $nvim_vimrc_link ]]; then
    fail "neovim config is a real file, not a link to the vimrc!"
  else
    success "neovim config link exists"
  fi
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

install_vundle () {
  # TODO: UPDATE TO vim-plug!
  echo ""
  info "checking for Vundle installation..."
  if [ -e ~/.vim/bundle/Vundle.vim ]
  then
    success "looks like Vundle is installed!"
  else
    user "Vundle seems to be missing... Install it? [y/n]"
    read -n 1 action

    case "$action" in
      y )
        echo ""
        info "Installing Vundle. Be sure to run :PluginInstall next time you run Vim."
        echo ""
        git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim;;
      * )
        ;;
    esac
  fi
}

install_dotfiles
# install_vundle
setup_nvim_dir

echo ''
echo '  All installed!'

