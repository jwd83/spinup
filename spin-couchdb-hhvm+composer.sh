#!/bin/bash

# CouchDB + HHVM + Composer for Ubuntu 12.04 LTS
cd ~

wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | sudo apt-key add -
echo deb http://dl.hhvm.com/ubuntu precise main | sudo tee /etc/apt/sources.list.d/hhvm.list

apt-get update -y && apt-get upgrade -y
apt-get install couchdb php5-cli hhvm git -y

curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
wget https://raw.github.com/jared0x90/spinup/master/config/config.hdf

mkdir -p /srv/hhvm/app
