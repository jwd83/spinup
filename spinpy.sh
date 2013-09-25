#!/bin/bash

# Update apt-get and basic packages
apt-get update
apt-get upgrade -y

# Install our apps
apt-get install -y gcc
apt-get install -y git
apt-get install -y gunicorn
apt-get install -y htop
apt-get install -y iftop
apt-get install -y make
apt-get install -y mlocate
apt-get install -y nano
apt-get install -y nginx
apt-get install -y ntp
apt-get install -y sshfs
apt-get install -y ufw
apt-get install -y vim

# Setup firewall rules
ufw allow 22
ufw allow 80
ufw enable

# Get distribute, pip & virtualenv running
curl -O http://python-distribute.org/distribute_setup.py
python distribute_setup.py
easy_install pip
pip install virtualenv
pip install virtualenvwrapper

# Install some of my favorite python packages
pip install flask
pip install markdown

# Update mlocate db
updatedb

# Crontab updates
# write out current crontab
crontab -l > mycron
echo "@hourly updatedb >/dev/null 2>&1" >> mycron
# install new cron file
crontab mycron
rm mycron
