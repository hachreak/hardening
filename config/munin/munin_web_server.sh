#!/bin/sh

cd /var/cache/munin/www
python ~/bin/auth-http-server.py 5050 "$MUNIN_USER:$MUNIN_PWD" 2> /dev/null > /dev/null &

