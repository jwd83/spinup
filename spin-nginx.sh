#!/bin/bash

# -------------------------------------
# Basic Setup
# -------------------------------------
# Update apt-get
apt-get update

# Offer to upgrade packages
read -p "Upgrade packages? y/N" yesorno
case "$yesorno" in
    y*)  apt-get upgrade -y ;;
esac

# -------------------------------------
# Install our apps
# -------------------------------------
# Firewall
apt-get install -y ufw
# Development tools
apt-get install -y gcc
apt-get install -y git
apt-get install -y make
# System Monitoring
apt-get install -y atop
apt-get install -y htop
apt-get install -y iftop
# System utilities
apt-get install -y mlocate
apt-get install -y ntp
apt-get install -y sshfs
# Text editors
apt-get install -y nano
apt-get install -y vim
# Install our specific apps
apt-get install -y nginx

# Setup firewall rules
ufw allow 22
ufw allow 80
ufw enable
