Ryan's Dotfiles
===============

use at your own risk...


## Setup Notes

1. clone the dotfiles repo into a reasonable location on the new host,
e.g., ```~/workspace/dotfiles```


2. pull in the submodules:

    ```git submodule init```

    ```git submodule update --recursive```

    note: may need to repeat this within the `zprezto.symlink` area


3. install the links to files in the home directory: `./install.sh` 
Note that it is safe to re-run this when new `.symlink` files are added.

4. install Vundle (the `vim` package manager):
    `git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle`

    run: `:BundleInstall` inside vim.


### OS X Extra Steps
* Set some reasonable defaults: ```sh ./osx```
* Be sure homebrew is installed

## Helpful Links

[http://dotfiles.github.io/](http://dotfiles.github.io/)

