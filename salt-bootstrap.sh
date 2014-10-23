#!/bin/sh -

python -c 'import urllib; print urllib.urlopen("https://bootstrap.saltstack.com").read()' > install_salt.sh
sudo sh install_salt.sh
