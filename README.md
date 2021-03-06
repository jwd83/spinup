# spinup

A collection of scripts to help spin up Ubuntu/Debian Virtual Machines.

These scripts are to be run on *FRESH INSTALLS ONLY*.

I test these on $5/mo SSD cloud servers from Digital Ocean! Please use my
referral code if you would like to give them a try. It helps me keep the
lights on :-)

https://www.digitalocean.com/?refcode=a0f6a3bca1c8

# License: MIT

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

# Package Notes

## One Trick Ponies

### Docker

    bash <(wget -qO- https://raw.github.com/jwd83/spinup/master/spin-docker.sh)

### CouchDB
Relax.

    bash <(wget -qO- https://raw.github.com/jwd83/spinup/master/spin-couch.sh)

### Couchbase CE 2.2 x64

    bash <(wget -qO- https://raw.github.com/jwd83/spinup/master/spin-couchbase-ce-2.2.sh)

### Couchbase EE 2.5 x64

    bash <(wget -qO- https://raw.github.com/jwd83/spinup/master/spin-couchbase-ee-2.5.sh)

### MariaDB Galera Cluster

Heavily incomplete. Intended to spin up a MariaDB galera cluster VM.


    bash <(wget -qO- https://raw.github.com/jwd83/spinup/master/spin-galera.sh)

### Gunicorn Worker

Hookup your WSGI Python Apps and prepare them for webs server of choice. Web
server not included (unless you count Gunicorn).

    bash <(wget -qO- https://raw.github.com/jwd83/spinup/master/spin-gunicorn.sh)

### NGINX Web Server

Ready to cluster Gunicorn workers? This is still W.I.P. I have a config file
where I left off included in this repo. See: nginxpy.conf

    bash <(wget -qO- https://raw.github.com/jwd83/spinup/master/spin-nginx.sh)

### Deluge Thin Client

    bash <(wget -qO- https://raw.github.com/jwd83/spinup/master/spin-deluge.sh)

## Short Stacks

### CHaN: Composer + HHVM and NGINX

#### Benchmarks

On a 512MB Digital Ocean droplet this stack serves up the performance numbers
below. The static test involves grabbing one of the Twitter Bootstrap 3 CSS
files from the http://localhost/static/... The dynamic test involves rendering
a lightly modified Twig template of the Twitter Bootstrap 3 admin panel by the
Slim PHP microframework.

##### Static
Requests per second:    4320.25  (373,248,000 a day)

##### Dynamic
Requests per second:    290.09 (25,056,000 a day)

#### Install

    bash <(wget -qO- https://raw.github.com/jwd83/spinup/master/stack-chan.sh)

### CrUNCH: Composer + NGINX + CouchDB + HHVM on Ubuntu
Want the bleeding edge? It doesn't get easier than this. Composer's package
management, Facebook's HHVM JiT & CouchDB - one of the easiest NoSQL Databases
to use with point and click replication sitting behind NGINX the powerhouse.

#### Notes

Your local CouchDB password is accessible in PHP (HHVM) using...

	$_SERVER['COUCH_PASS'];

...or...

	$_ENV['COUCH_PASS'];

#### Ports
* 22: SSH
* 80: HTTP
* 5984: CouchDB

#### Install

    bash <(wget -qO- https://raw.github.com/jwd83/spinup/master/stack-crunch.sh)

# ToDo

1. Reformat the One Trick Ponies to inlcude install instructions in the main notes.
2. Split Python into a Gunicon workers spinup and an NGINX reverse proxy spinup.
3. Create a MariaDB spinup.
4. Create a MongoDB spinup.
