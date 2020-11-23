#!/bin/bash

# Do basic debian setup
source <(curl -s https://raw.githubusercontent.com/jwd83/dotfiles/master/setup-debian.sh)

# Install rvm
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable

source /etc/profile.d/rvm.sh
