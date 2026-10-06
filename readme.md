Ryan's Dotfiles
===============

Use at your own risk...

Questions? [@lbwski](http://twitter.com/lbwski)


## Setup Notes

0. `legacy-installer.sh` contains the list of files that get linked into the
   home directory (`DOTFILES_LIST`), plus a separate list for links under
   `~/.config` (`CONFIG_LINKS`). Be sure to update those if you add/rename a
   file! (It's named "legacy" so Codespaces won't try to auto-run it, since it
   prompts interactively.)

1. Clone the dotfiles repo into a reasonable location on the new host, e.g.,
   `~/workspace/dotfiles`

2. Pull in the submodules: `./update_submodules.sh`

3. From the repo directory, install the links: `./legacy-installer.sh`. It
   asks before touching anything that already exists, so it is safe to re-run
   when new files are added.

4. Open vim/neovim once: the `vimrc` downloads
   [vim-plug](https://github.com/junegunn/vim-plug) automatically if it's
   missing and installs the plugins.


### OS X Extra Steps
* Set some reasonable defaults by executing some of the commands in `osx`
  (read what they do first - don't just blindly execute that as a script!)
* Be sure [homebrew](http://brew.sh/) is installed

## Helpful Links

[http://dotfiles.github.io/](http://dotfiles.github.io/)

## Attribution

I try to leave a comment where it isn't obvious where something came from
originally, but there are some significant areas where I have been remiss. In
general what you're seeing here is years and years of tweaks and tips picked
up along the way from others.

## Historical note

The files and directories to-be-linked were previously identified with a
`.symlink` extension (which was stripped via `basename` upon install). This is
no longer the case because Github has a hard time determining the syntax of
files named this way.
