Ryan's Dotfiles
===============

Use at your own risk...

Questions? [@lbwski](http://twitter.com/lbwski)


## Setup Notes

0. The `install.sh` contains an array of files that should be linked. Be sure
   to update that if you add/rename a file!

1. Clone the dotfiles repo into a reasonable location on the new host, e.g.,
   `~/workspace/dotfiles`

2. Pull in the submodules: `./update_submodules.sh`

3. Install the links to files in the home directory: `./install.sh`.  This
   command will also check to see if `Vundle` is installed. Note that it is
   safe to re-run this when new files are added.


### OS X Extra Steps
* Set some reasonable defaults: `sh ./osx`
* Be sure homebrew is installed

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
