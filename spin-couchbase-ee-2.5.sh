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
# 8091, 8092, 18091, 18092, 11214, 11215 and from 21100 to 21299.

ufw allow 11211
ufw allow 11210
ufw allow 11209
ufw allow 4369
ufw allow 8091
ufw allow 8092
ufw allow 18091
ufw allow 18092
ufw allow 11214
ufw allow 11215
ufw allow proto tcp to any port 21100:21299


echo "Turning on firewall"
ufw --force  enable

echo "Installing Couchbase EE 2.5.0 x64"
wget http://packages.couchbase.com/releases/2.5.0/couchbase-server-enterprise_2.5.0_x86_64.deb
dpkg -i couchbase-server-enterprise_2.5.0_x86_64.deb
