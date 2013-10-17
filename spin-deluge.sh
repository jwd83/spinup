#!/bin/bash

# Update apt-get and basic packages
apt-get update
apt-get upgrade -y

# Install our apps
apt-get install -y ufw
apt-get install -y deluged
apt-get install -y deluge-console

# Setup firewall rules
ufw allow 22
ufw allow 58846
ufw enable

# Enable Remote Connection
deluge-console "config -s allow_remote True"
deluge-console "config allow_remote"

# Create Default Config
deluged
sleep 2
pkill deluged

# Create a user
echo "alice:MyC0mpL3xPass:10" >> ~/.config/deluge/auth
