#!/bin/bash

# Install some of my commonly used config files.
# Create symlinks when possible.

# Install youtube-dl config file.
sudo ln -sf ~/scripts/config-files/cygwin/youtube-dl.conf ~/youtube-dl.conf

# Copy .netrc file.  It will need to be updated manually after copying.
cp ~/scripts/config-files/cygwin/.netrc ~/.netrc
