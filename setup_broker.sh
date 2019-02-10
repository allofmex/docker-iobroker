#!/usr/bin/env bash
mkdir /opt/iobroker
chmod 777 /opt/iobroker
curl -sL https://raw.githubusercontent.com/ioBroker/ioBroker/stable-installer/installer.sh | bash -
