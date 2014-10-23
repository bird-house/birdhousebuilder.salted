#!/bin/bash

CURRENT=`pwd`
BASENAME=`basename $CURRENT`

python -c 'import urllib; print urllib.urlopen("https://bootstrap.saltstack.com").read()' > install_salt.sh

read -p "Start Installation? (y/n) " -n 1
echo
if [ $REPLY != 'y' ]; then
    exit 1      
fi

sudo sh install_salt.sh
sudo sh -c "echo 'file_client: local' >> /etc/salt/minion"
sudo ln -sf $CURRENT/salt /srv/salt
sudo salt-call state.highstate

exit 0
