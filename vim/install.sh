#!/bin/bash

dir=bundle
if [ ! -d $dir ]; then
  mkdir $dir
fi

cd $dir

dir=gruvbox
if [ ! -d $dir ]; then
  git clone git@github.com:morhetz/$dir.git
else
  cd $dir git pull
  cd ..
fi

dir=nerdcommenter
if [ ! -d $dir ]; then
  git clone git@github.com:scrooloose/$dir.git
else
  cd $dir git pull
  cd ..
fi

dir=nerdtree
if [ ! -d $dir ]; then
  git clone git@github.com:scrooloose/$dir.git
else
  cd $dir git pull
  cd ..
fi

dir=supertab
if [ ! -d $dir ]; then
  git clone git@github.com:ervandew/$dir.git
else
  cd $dir git pull
  cd ..
fi

dir=taglist.vim
if [ ! -d $dir ]; then
  git clone git@github.com:vim-scripts/$dir.git
else
  cd $dir git pull
  cd ..
fi

dir=limelight.vim
if [ ! -d $dir ]; then
  git clone https://github.com/junegunn/limelight.vim.git
else
  cd $dir git pull
  cd ..
fi

dir=goyo.vim
if [ ! -d $dir ]; then
  git clone git@github.com:vim-scripts/$dir.git
else
  cd $dir git pull
  cd ..
fi
