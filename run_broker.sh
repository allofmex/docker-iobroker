#!/usr/bin/env bash
/opt/iobroker/iobroker start
# Seems iobroker start does not start admin interface, so we start it manually here.
# This will run in foreground, so it keeps the container running too.
node node_modules/iobroker.admin/main.js --logs
