#!/bin/bash
# -------------------------------------
# Basic Setup
# -------------------------------------
# Update apt-get
apt-get update

# Offer to upgrade packages
read -p "Upgrade packages? [y/N] " yesorno
case "$yesorno" in
    y*)  apt-get upgrade -y ;;
esac

# Install our apps
apt-get install -y ufw
apt-get install -y deluged
apt-get install -y deluge-console
apt-get install -y apache2
apt-get install -y apache2-utils

# Setup firewall rules
ufw allow 22
ufw allow 80
ufw allow 58846
ufw enable

# -------------------------------------
# Deluge Create Config & Credentials
# -------------------------------------
deluged
sleep 2
deluge-console "config -s allow_remote True"
deluge-console "config allow_remote"
pkill deluged

# Create random admin credentials
DELUGE_USER=$(cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 12 | head -n 1)
DELUGE_PASS=$(cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 12 | head -n 1)

# Install admin credentials
echo "$DELUGE_USER:$DELUGE_PASS:10" >> ~/.config/deluge/auth
deluged

# -------------------------------------
# Apache Create Config & Credentials
# -------------------------------------
htpasswd -b -c ~/var/.htpasswd $DELUGE_USER $DELUGE_PASS
rm -f /var/www/index.html
sed '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride all/' /etc/apache2/apache2.conf
service apache2 reload
# -------------------------------------
# Display config to the user
# -------------------------------------
echo "--- HERE ARE YOUR DELUGE SERVER DETAILS. COPY THESE DOWN ---"
printf "Your public IP: "

# Can revert to ifconfig.me if v4.ident.me ever goes down.
# v4 seems to return far quicker than ifconfig.me. Can remove
# the blank echo when using ifconfig.me

# curl ifconfig.me
curl v4.ident.me
echo
echo "Your admin username: $DELUGE_USER"
echo "Your admin password: $DELUGE_PASS"
