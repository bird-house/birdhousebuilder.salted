#!/bin/bash
openssl req -batch -x509 -nodes -days 365 -subj '{{subject}}' -newkey rsa:2048 -keyout {{cert}} -out {{cert}}
