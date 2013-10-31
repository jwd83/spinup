# spinup

A collection of scripts to help spin up Ubuntu/Debian Virtual Machines.

## ToDo

1. Split Python into a Gunicon workers spinup and an NGINX reverse proxy spinup.
2. Create a MariaDB spinup.
3. Create a MongoDB spinup.

## Instructions

Run these commands as the root user.

### Gunicorn Worker

    bash <(wget -qO- https://raw.github.com/jared0x90/spinup/master/spin-gunicorn.sh)

### NGINX Web Server

    bash <(wget -qO- https://raw.github.com/jared0x90/spinup/master/spin-nginx.sh)

### Deluge Thin Client

    bash <(wget -qO- https://raw.github.com/jared0x90/spinup/master/spin-deluge.sh)
