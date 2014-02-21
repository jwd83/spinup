apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
sh -c "echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
apt-get update -y && apt-get upgrade -y
apt-get install lxc-docker
cp /etc/default/ufw /etc/default/ufw.bak
SEDFIND="DEFAULT_FORWARD_POLICY=\"DROP\""
SEDREPLACE="DEFAULT_FORWARD_POLICY=\"ACCEPT\""
sed -i "s/$SEDFIND/$SEDREPLACE/g" /etc/default/ufw
ufw reload
ufw allow 4243/tcp
ufw allow 22
ufw enable
