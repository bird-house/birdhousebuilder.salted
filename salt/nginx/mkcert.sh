#!/bin/bash
openssl req -batch -x509 -nodes -days 365 -subj '/C=DE/O=MyCompony/OU=MyOrg/CN=localhost' -newkey rsa:2048 -keyout /etc/nginx/proxy.cert -out /etc/nginx/proxy.cert
