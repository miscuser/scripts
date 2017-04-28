#!/bin/bash
# Install symlinks to dotfiles.
dotfiles_dir=~/dotfiles

# Delete existing dot files.
rm -rf ~/.vimrc > /dev/null 2>&1
rm -rf ~/.bashrc > /dev/null 2>&1
rm -rf ~/.tmux.conf > /dev/null 2>&1
rm -rf ~/.agignore > /dev/null 2>&1

# Create symlinks in home folder.
#==============
ln -sf $dotfiles_dir/.vimrc ~/.vimrc
ln -sf $dotfiles_dir/.bashrc ~/.bashrc
ln -sf $dotfiles_dir/.tmux-conf ~/.tmux-conf
ln -sf $dotfiles_dir/.agignore ~/.agignore
