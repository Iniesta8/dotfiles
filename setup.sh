#!/bin/sh

echo "Create symlinks in home directory..."
for ele in ".config/xfce4/terminal/terminalrc" ".tmux.conf" ".vim" ".vimrc" 
do
  echo "Create symlink $HOME/$ele -> $PWD/$ele"
  ln -si $PWD/$ele $HOME/$ele
done
echo "Done."
