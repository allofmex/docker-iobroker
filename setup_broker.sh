#!/usr/bin/env bash
mkdir /opt/iobroker
chmod 777 /opt/iobroker
cd /opt/iobroker && npm install iobroker --unsafe-perm
cd /opt/iobroker && npm i --production --unsafe-perm

