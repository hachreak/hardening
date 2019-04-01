#!/bin/sh

echo "[SSH] Disable password login"
[ -z `cat /etc/ssh/sshd_config | grep ^PasswordAuthentication` ] && echo "PasswordAuthentication no" >> /etc/ssh/sshd_config

echo "[SSH] Client alive interval: 120"
[ -z `cat /etc/ssh/sshd_config | grep ^ClientAliveInterval` ] && echo "ClientAliveInterval 120" >> /etc/ssh/sshd_config
