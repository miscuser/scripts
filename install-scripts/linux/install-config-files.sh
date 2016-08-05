#!/bin/bash

# Install some of my commonly used config files.
# Create symlinks when possible.

# Install youtube-dl config file.
sudo rm -rf /etc/youtube-dl.conf > /dev/null 2>&1
sudo ln -sf ~/scripts/config/linux/youtube-dl.conf /etc/youtube-dl.conf
