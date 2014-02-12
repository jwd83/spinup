# spinup

A collection of scripts to help spin up Ubuntu/Debian Virtual Machines.

These scripts are to be run on *FRESH INSTALLS ONLY*.

# The MIT License (MIT)

Copyright (c) 2013 Jared De Blander

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


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

### MariaDB Galera Cluster for Ubuntu 12.04LTS

    bash <(wget -qO- https://raw.github.com/jared0x90/spinup/master/spin-galera.sh)

### CouchDB + HHVM + Composer for PHP

    bash <(wget -qO- https://raw.github.com/jared0x90/spinup/master/spin-couchdb-hhvm+composer.sh)
