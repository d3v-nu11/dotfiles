#!/bin/bash
############################

dir=$PWD
olddir=$dir/old_dotfiles
files="bashrc vimrc vim Xdefaults"

echo "Creating $olddir for backup of existing dotfiles"
mkdir -p $olddir
echo "...done"

for file in $files; do
    echo "Moving $file ~ to $olddir"
    mv ~/.$file $olddir
    echo "symlink to $file"
    ln -s $dir/$file ~/.$file
done
