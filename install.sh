#!/bin/bash
############################

dir=$PWD
files="bashrc vimrc vim Xdefaults tmux.conf bash_aliases"

for file in $files; do
  rm -rf ~/.$file
  echo "symlink to $file"
  ln -s $dir/$file ~/.$file
done

file="vim"
if [ -d ~/.$file ]; then
  cd ~/.$file
  ./install.sh
  cd bundle/gruvbox
  ./gruvbox_256palette.sh
fi

xrdb ~/.Xdefaults
