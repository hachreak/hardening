#!/bin/sh

cd /var/cache/munin/www
python ~/bin/auth-http-server.py 5050 "$1:$2" 2> /dev/null > /dev/null &

