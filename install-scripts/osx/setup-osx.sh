#!/bin/bash
# Configure OSX.

# Clone other repos.
# ------------------
git clone git://github.com/miscuser/dotfiles.git ~/dotfiles
git clone git://github.com/miscuser/bin.git ~/bin
git clone git://github.com/miscuser/colors.git ~/.vim/colors

# Install Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install useful packages.
brew install tmux
brew install the_silver_searcher
brew install ack
brew install vim
# brew install libav

# Alias dotfiles in home directory.
# ---------------------------------
sudo ~/scripts/install-scripts/osx/create-symlinks.sh
