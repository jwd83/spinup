#!/bin/bash
# CouchDB + HHVM + Composer

# Generate a random admin password for CouchDB
COUCH_PASS=$(cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 12 | head -n 1)


# Go to root's home folder if we aren't there already
cd ~

# Add Facebook's HHVM to our sources
wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | sudo apt-key add -
echo deb http://dl.hhvm.com/ubuntu saucy main | sudo tee /etc/apt/sources.list.d/hhvm.list

# Update the VM and install CouchDB, PHP5 CLI, HHVM, git & UFW
apt-get update -y && apt-get upgrade -y
apt-get install couchdb php5-cli php5-json hhvm git ufw -y

# Install Composer globally
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# Download HHVM config
wget https://raw.github.com/jared0x90/spinup/master/config/config.hdf

# Make a place for our app to go per our HHVM config.hdf
mkdir -p /srv/hhvm/app

# Configure firewall rules
ufw allow 22	# SSH
ufw allow 80	# HTTP
ufw enable

# Setup CouchDB access. Turn off the admin party and enable remote access.
cd /etc/couchdb/
rm local.ini
wget https://raw.github.com/jared0x90/spinup/master/config/local.ini
echo admin=$COUCH_PASS >> /etc/couchdb/local.ini
chown couchdb.couchdb local.ini
service couchdb restart

clear
echo Important file locations...
echo Couch Config: /etc/couchdb/local.ini
echo
echo Passwords...
echo Couch admin Password: $COUCH_PASS