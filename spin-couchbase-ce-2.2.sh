cd ~

echo "Preparing firewall"

# Firewall ports
#
# SSH
#
ufw allow 22
# Couchbase
#
# Taken from the Couchbase install notes.
#
# Please note that you have to update your firewall configuration to
# allow connections to the following ports: 11211, 11210, 11209, 4369,
# 8091, 8092 and from 21100 to 21299.

ufw allow 11211
ufw allow 11210
ufw allow 11209
ufw allow 4369
ufw allow 8091
ufw allow 8092
ufw allow proto tcp to any port 21100:21299

echo "Turning on firewall"
ufw enable

echo "Installing Couchbase CE 2.2"
wget http://packages.couchbase.com/releases/2.2.0/couchbase-server-community_2.2.0_x86_64.deb
dpkg -i couchbase-server-community_2.2.0_x86_64.deb
