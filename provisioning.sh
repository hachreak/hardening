#!/bin/sh

SUSER=${SUSER:-hachreak@}
DUSER=${DUSER:-hachreak}
DID=${DID:-1000}

echo "Create default group [$DUSER]"
[ -z `cat /etc/group | grep $DUSER` ] && groupadd -r $DUSER -g $DID
echo "Create default user [$DUSER]"
[ -z `cat /etc/passwd| grep $DUSER` ] && useradd -s /bin/bash -d /home/$DUSER -m -u $DID -r -g $DUSER $DUSER


echo "[SSH] key generator.."
! [ -f /home/$DUSER/.ssh/id_rsa ] && runuser $DUSER -c "ssh-keygen -t rsa -b 4096 -q -f /home/$DUSER/.ssh/id_rsa -N \"\""
echo "[SSH] copy public key"
[ -z `cat /home/$DUSER/.ssh/authorized_keys 2> /dev/null | awk '{print $3}' | grep $SUSER` ] && cat ~/.ssh/authorized_keys >> /home/$DUSER/.ssh/authorized_keys


echo "[Munin] Install web UI"
! [ -d /home/$DUSER/bin ] && mkdir /home/$DUSER/bin && \
  echo "PATH=\$PATH:/home/$DUSER/bin" >> ~/.bashrc
cp config/munin/auth-http-server.py config/munin/munin_web_server.sh /home/$DUSER/bin/
chown $DUSER:$DUSER /home/$DUSER/bin -R
