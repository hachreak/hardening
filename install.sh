#!/bin/sh

apt-get update
apt-get install -y fail2ban make openssh-server byobu gcc g++ make \
  build-essential libncurses5-dev curl munin munin-plugins-extra munin-node
