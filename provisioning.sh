#!/bin/sh

DUSER=${DUSER:-hachreak}
DID=${DID:-1000}

echo "Create default group [$DUSER]"
[ -z `groups | grep $DUSER` ] && groupadd -r $DUSER -g $DID
echo "Create default user [$DUSER]"
[ -z `cat /etc/passwd| grep $DUSER` ] && useradd -d /home/$DUSER -m -u $DID -r -g $DUSER $DUSER


echo "SSH key generator.."
! [ -f /home/$DUSER/.ssh/id_rsa ] && runuser $DUSER -c "ssh-keygen -t rsa -b 4096 -q -f /home/$DUSER/.ssh/id_rsa_test -N \"\""
