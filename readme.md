Ryan's Dotfiles
===============

use at your own risk...


## Setup Notes

1. Clone the dotfiles repo into a reasonable location on the new host,
e.g., `~/workspace/dotfiles`

2. Pull in the submodules: `./update_submodules.sh`

3. Install the links to files in the home directory: `./install.sh`.
   This command will also check to see if `Vundle` is installed. Note
   that it is safe to re-run this when new `.symlink` files are added.  


### OS X Extra Steps
* Set some reasonable defaults: `sh ./osx`
* Be sure homebrew is installed

## Helpful Links

[http://dotfiles.github.io/](http://dotfiles.github.io/)

