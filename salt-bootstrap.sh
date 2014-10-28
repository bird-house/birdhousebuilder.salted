#!/bin/bash

CURRENT=`pwd`
BASENAME=`basename $CURRENT`

#SCRIPT_URL="https://bootstrap.saltstack.com"
SCRIPT_URL="https://raw.githubusercontent.com/cehbrecht/salt-bootstrap/develop/bootstrap-salt.sh"

python -c "import urllib; print urllib.urlopen(\"$SCRIPT_URL\").read()" > install_salt.sh

read -p "Start Installation? (y/n) " -n 1
echo
if [ $REPLY != 'y' ]; then
    exit 1      
fi

sudo sh install_salt.sh stable
sudo sh -c "echo 'file_client: local' >> /etc/salt/minion"
sudo ln -sf $CURRENT/salt /srv/salt
#sudo salt-call state.highstate

exit 0
