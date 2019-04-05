# dotfiles

Some of my dotfiles that I use on linux machines. Buyer beware ;)

## Setup

### Install by script

The easiest way to install all dotfiles is to run the setup.sh script:
```bash
chmod u+x ./setup.sh && ./setup.sh
```

### Manual install

**vim**
* copy or symlink `.vim` and `.vimrc` to `~` (to avoid swap file errors you propably have to create a 'swaps'-folder in .vim/)
* download and install [vim-plug](https://github.com/junegunn/vim-plug).
* start a vim session and install plugins via `:PlugInstall`

**Terminal**
* My favourite terminal emulator is [urxvt](https://wiki.archlinux.org/index.php/rxvt-unicode). It is customized by editing `.Xresources`.
* When using xfce's terminal the `terminalrc` file is located in `.config/xfce4/terminal`

**others**
* copy or symlink `$file` to `~`

