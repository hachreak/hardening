#!/bin/sh

echo "[SSH] disable password login"
[ -z `cat /etc/ssh/sshd_config | grep ^PasswordAuthentication` ] && echo "PasswordAuthentication no" >> /etc/ssh/sshd_config

echo "[SSH] client alive interval: 120"
[ -z `cat /etc/ssh/sshd_config | grep ^ClientAliveInterval` ] && echo "ClientAliveInterval 120" >> /etc/ssh/sshd_config

echo "[SSH] reload server"
service ssh restart

######

echo "[Fail2ban] Copy jail configuration"
cp config/fail2ban/jail.local /etc/fail2ban

echo "[Fail2ban] reload server"
service fail2ban restart
