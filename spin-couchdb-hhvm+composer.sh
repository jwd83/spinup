#!/bin/bash

# CouchDB + HHVM + Composer for Ubuntu 12.04 LTS

wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | sudo apt-key add -
echo deb http://dl.hhvm.com/ubuntu precise main | sudo tee /etc/apt/sources.list.d/hhvm.list

apt-get update -y && apt-get upgrade -y
apt-get install couchdb php5 hhvm -y

curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
