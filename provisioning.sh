#!/bin/sh

DUSER=${DUSER:-hachreak}

echo "Create default group [$DUSER]"
[ -z `groups | grep $DUSER` ] && groupadd -r $DUSER -g 1000
echo "Create default user [$DUSER]"
[ -z `cat /etc/passwd| grep $DUSER` ] && useradd -d /home/$DUSER -m -u 1000 -r -g $DUSER $DUSER


echo "SSH key generator.."
! [ -f /home/$DUSER/.ssh/id_rsa ] && runuser $DUSER -c "ssh-keygen -t rsa -b 4096 -q -f /home/$DUSER/.ssh/id_rsa_test -N \"\""
