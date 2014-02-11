#!/bin/bash

# This is for MariaDB Galera Cluster for Ubuntu 12.04 LTS

apt-get update -y && apt-get upgrade -y
apt-get install python-software-properties -y
apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
add-apt-repository 'deb http://mirrors.syringanetworks.net/mariadb/repo/5.5/ubuntu precise main'
apt-get update -y
sudo apt-get install mariadb-galera-server galera -y
service mysql stop
