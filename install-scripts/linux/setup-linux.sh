#!/bin/bash

# New machine installation script.
# sudo git clone http://www.github.com/miscuser/scripts.git ~/scripts

# NOTES
# -----
# * add option to install wallpaper

# Log the results.
# ----------------
log_file=~/install_progress_log.txt

# Clone other repos.
# ------------------
git clone git://github.com/miscuser/dotfiles.git ~/dotfiles
git clone git://github.com/miscuser/bin.git ~/bin
git clone git://github.com/miscuser/colors.git ~/.vim/colors

# Alias dotfiles in home directory.
# ---------------------------------
sudo ~/scripts/install-scripts/linux/create-symlinks.sh

# Install useful packages. 
# ------------------------
sudo apt-get -y install vim
if type -p vim > /dev/null; then
    echo "Vim installed" >> $log_file
else
    echo "Vim FAILED TO INSTALL" >> $log_file
fi

sudo apt-get install tmux
if type -p tmux > /dev/null; then
    echo "tmux installed" >> $log_file
else
    echo "tmux FAILED TO INSTALL" >> $log_file
fi

sudo apt-get install libav-tools
if type -p avconv > /dev/null; then
    echo "libav-tools installed" >> $log_file
else
    echo "libav-tools FAILED TO INSTALL" >> $log_file
fi

sudo apt-get install dos2unix
if type -p dos2unix > /dev/null; then
    echo "dos2unix installed" >> $log_file
else
    echo "dos2unix FAILED TO INSTALL" >> $log_file
fi

sudo apt-get -y install pandoc
if type -p pandoc > /dev/null; then
    echo "Pandoc installed" >> $log_file
else
    echo "Pandoc FAILED TO INSTALL" >> $log_file
fi

sudo apt-get -y install texlive-full
if type -p texlive > /dev/null; then
    echo "TexLive installed" >> $log_file
else
    echo "TexLive FAILED TO INSTALL" >> $log_file
fi

sudo apt-get -y install keepassx
if type -p keepassx > /dev/null; then
    echo "keepassx installed" >> $log_file
else
    echo "keepassx FAILED TO INSTALL" >> $log_file
fi

sudo apt-get -y install curl
if type -p curl > /dev/null; then
    echo "curl installed" >> $log_file
else
    echo "curl FAILED TO INSTALL" >> $log_file
fi

sudo apt-get -y install dconf-tools
if type -p dconf > /dev/null; then
    echo "dconf-tools installed" >> $log_file
else
    echo "dconf-tools FAILED TO INSTALL" >> $log_file
fi

sudo apt-get install silversearcher-ag
if type -p ag > /dev/null; then
    echo "Silver Searcher installed" >> $log_file
else
    echo "Silver Searcher FAILED TO INSTALL" >> $log_file
fi

sudo apt-get install gnome-tweak-tool
if type -p gnome-tweak-tool > /dev/null; then
    echo "gnome-tweak-tool installed" >> $log_file
else
    echo "gnome-tweak-tool FAILED TO INSTALL" >> $log_file
fi

# Get youtube-dl
sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

# Change folder view to lists.
# ----------------------------
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
gsettings set org.gnome.nautilus.preferences executable-text-activation launch

# Display results. 
# ----------------
echo -e "\n====== Summary ======\n"
cat $log_file
