#!/bin/bash

cd ~

wget https://raw.github.com/jared0x90/spinup/master/config/stack-chan-nginx.conf

# Add Facebook's HHVM to our sources
wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | sudo apt-key add -
echo deb http://dl.hhvm.com/ubuntu saucy main | sudo tee /etc/apt/sources.list.d/hhvm.list

# Update the VM and install HHVM, NGINX, git, PHP5 CLI (for Composer), Composer itself & UFW
apt-get update -y && apt-get upgrade -y
apt-get install php5-cli php5-json hhvm-fastcgi git ufw nginx -y
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# Configure firewall rules
ufw allow 22    # SSH
ufw allow 80    # HTTP
ufw enable

# Make a place for our app to go per our HHVM config.hdf and create the static and images folders
mkdir -p /srv/hhvm/app/static/images
