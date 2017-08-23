#!/bin/bash

#####
# Create symlinks for dotfiles.
# Remember to `chmod +x PATH_TO_THIS_FILE` to make it executable
#####

dotfiles_dir=~/dotfiles/dottedfiles  # Directory for dotfiles
olddir=~/former_dotfiles # If there are old dotfiles when this script is run, move
# them here
files="bashrc bash_profile vimrc minvimrc Xresources" # list of files to symlink in homedir.

echo "making old dir"
mkdir -p $olddir
echo "change directory to dotfiles"
cd $dir
echo "done"

# move existig dotfiles from home directory to dotfiles_old directory.
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/former_dotfiles/
    echo "Creating symlink"
    ln -s $dotfiles_dir/$file ~/.$file
done

#####
# Neovim config
#####
echo "Creating symlink for nvim config"
nvim_config_directory=~/.config/nvim
mkdir -p $nvim_config_directory
ln -s $dotfiles_dir/nvim/init.vim $nvim_config_directory/init.vim

#####
# Create symlinks for snippets
#####
snippetsdir=~/.vim/snippets
mkdir -p $snippetsdir
snippet_files=~/dotfiles/snippets/*.snippets

for file in $snippet_files; do
    echo "creating symlink for snippet"
    fname=`basename $file`
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.vim/snippets/$fname ~/former_dotfiles/
    ln -s $file ~/.vim/snippets/$fname
done

