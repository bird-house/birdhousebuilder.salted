#!/bin/bash

CURRENT=`pwd`
BASENAME=`basename $CURRENT`

#SCRIPT_URL="https://bootstrap.saltstack.com"
SCRIPT_URL="https://raw.githubusercontent.com/saltstack/salt-bootstrap/develop/bootstrap-salt.sh"
#SCRIPT_URL="https://raw.githubusercontent.com/cehbrecht/salt-bootstrap/develop/bootstrap-salt.sh"

python -c "import urllib; print urllib.urlopen(\"$SCRIPT_URL\").read()" > install_salt.sh

if [ ! -f "install_salt.sh" ]; then
    echo "Downloading bootstrap-salt.sh script failed."
    exit 1
fi

read -p "Start SaltStack Installation? (y/n) " -n 1
echo
if [ $REPLY != 'y' ]; then
    exit 1      
fi

sudo sh install_salt.sh stable

echo "Setting up minon-only configuration ..."

sudo sh -c "echo 'file_client: local' >> /etc/salt/minion"
sudo ln -sf $CURRENT/salt /srv
#sudo salt-call state.highstate

echo "Installing SaltStack minion done."

exit 0
