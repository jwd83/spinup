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
apt-get install -y sshfs
apt-get install -y ufw
apt-get install -y vim

# Setup firewall rules
ufw allow 22
ufw allow 80
ufw enable

# Get ez_isntall and pip running
wget https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py
wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py

python ez_setup.py
python get-pip.py
