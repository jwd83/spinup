#!/bin/bash
# spin-couch.sh
# View the complete collection at: https://github.com/jared0x90/spinup

# CouchDB
# Generate a random admin password for CouchDB
COUCH_PASS=$(cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 24 | head -n 1)

# Update the VM and install CouchDB, PHP5 CLI, HHVM, git & UFW
apt-get update -y && apt-get upgrade -y
apt-get install couchdb git ufw -y

# Configure firewall rules
ufw allow 22    # SSH
ufw allow 5984
ufw --force enable

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
echo Couch Config: /etc/couchdb/local.ini
echo
echo Passwords...
echo Couch admin Password: $COUCH_PASS
echo Couch replication URL: http://admin:$COUCH_PASS@$HOSTNAME:5984/
