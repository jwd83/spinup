#!/bin/bash
# CrUNCH stack spinup
# Composer + NGINX + CouchDB + HHVM on Ubuntu

# Generate a random admin password for CouchDB
COUCH_PASS=$(cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 24 | head -n 1)

# Go to root's home folder if we aren't there already
cd ~

# Add Facebook's HHVM to our sources
wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | sudo apt-key add -
echo deb http://dl.hhvm.com/ubuntu saucy main | sudo tee /etc/apt/sources.list.d/hhvm.list

# Update the VM and install CouchDB, HHVM, NGINX, git, PHP5 CLI w/ JSON, Composer & UFW
apt-get update -y && apt-get upgrade -y
apt-get install couchdb php5-cli php5-json hhvm-fastcgi git ufw nginx -y
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# Configure firewall rules
ufw allow 22    # SSH
ufw allow 80    # HTTP
ufw allow 5984  # Couch
ufw --force  enable

# Make a place for our app to go per our HHVM config.hdf and create the static and images folders
mkdir -p /srv/hhvm/app/static/images

# Setup NGINX configuration
cd /etc/nginx
mv nginx.conf nginx.conf.bak
wget https://raw.github.com/jared0x90/spinup/master/config/stack-crunch-chan-nginx.conf
mv stack-crunch-chan-nginx.conf nginx.conf
SEDFIND="#DbPasswordHereForCruNCH"
SEDREPLACE="fastcgi_param  COUCH_PASS \"$COUCH_PASS\";"
sed -i "s/$SEDFIND/$SEDREPLACE/g" nginx.conf

# Create nginx.nginx
groupadd nginx
useradd -g nginx nginx

# Restart nginx
service nginx restart

# Setup HHVM-fastcgi to run at boot
update-rc.d hhvm-fastcgi defaults

# updatedb incase we need to run locate later lets prepare it
updatedb

# Setup CouchDB access. Turn off the admin party and enable remote access.
cd /etc/couchdb/
mv local.ini local.ini.bak
wget https://raw.github.com/jared0x90/spinup/master/config/spin-couch-local.ini
mv spin-couch-local.ini local.ini
echo admin=$COUCH_PASS >> /etc/couchdb/local.ini
chown couchdb.couchdb local.ini
service couchdb restart

clear
echo Important file locations...
echo
echo Couch Config: /etc/couchdb/local.ini
echo NGINX Config: /etc/nginx/nginx.conf
echo
echo HHVM App: /srv/hhvm/app/index.php
echo
echo Passwords...
echo
echo CouchDB Admin Password: $COUCH_PASS
echo
echo CouchDB Base Replication URL:
echo http://admin:$COUCH_PASS@$HOSTNAME:5984/
echo
echo CouchDB Futon Utility:
echo http://admin:$COUCH_PASS@$HOSTNAME:5984/_utils/
echo
