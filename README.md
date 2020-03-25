# dotfiles

Some of my dotfiles that I use on linux machines. Buyer beware ;)

## Setup

### Install by script

The easiest way to install all dotfiles is to run the setup.sh script:
```bash
chmod u+x ./setup.sh && ./setup.sh
```

### Manual install

Just create symlinks between cloned repository and your home directory...


## Important NVIM shortcuts

| Shortcut | Description |
| -------- | ----------- |
| ,        | Leader      |
| ,w       | Fast saving |
| ,W       | Sudo write  |
| ,q       | Quick close buffer |
| ,Q       | Quick close window |
| ,qq      | Close quickfix window |
| ,,       | Open last buffer |
| ,ls      | List buffers |
| gb       | Next buffer |
| gB       | Previous buffer |
| Y        | Yank from cursor to end of line |
| J        | Join lines and restore cursor location |
| \<Space\>  | Search |
| Ctrl-\<Space\> | Backwards search |
| ,[1-6]   | Highlight interesting word |
| ,j       | Open CtrlP |
| ,f       | Open MRU |
| ,nn      | Toggle NERDTree |
| ,n       | Focus NERDTree |
| ,C       | Toggle auto clang-format |
| ,N       | Toggle relative line numbers |
| ,fc      | Find merge conflict markers |
