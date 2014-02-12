#!/bin/bash
# CouchDB + HHVM + Composer for Ubuntu 12.04 LTS

# Go to root's home folder if we aren't there already
cd ~

# Add Facebook's HHVM to our sources
wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | sudo apt-key add -
echo deb http://dl.hhvm.com/ubuntu precise main | sudo tee /etc/apt/sources.list.d/hhvm.list

# Update the VM and install CouchDB, PHP5 CLI, HHVM & git
apt-get update -y && apt-get upgrade -y
apt-get install couchdb php5-cli hhvm git -y

# Install Composer globally
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# Download HHVM config
wget https://raw.github.com/jared0x90/spinup/master/config/config.hdf

# Make a place for our app to go per our HHVM config.hdf
mkdir -p /srv/hhvm/app
