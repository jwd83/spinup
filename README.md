# spinup

A collection of scripts to help spin up Ubuntu/Debian Virtual Machines.

## ToDo

1. Split Python into a Gunicon workers spinup and an NGINX reverse proxy spinup.
2. Modify the Deluge Thin Client to generate a random username and password and present this to the user at the end of the install.

## Instructions

Run these commands as the root user.

### Python Web Server

    bash <(wget -qO- https://raw.github.com/jared0x90/spinup/master/spin-py.sh)

### Deluge Thin Client

    bash <(wget -qO- https://raw.github.com/jared0x90/spinup/master/spin-deluge.sh)
