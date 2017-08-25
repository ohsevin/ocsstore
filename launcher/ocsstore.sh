#!/bin/bash

if [ -f './ocsstore-linux-x64/ocsstore' ]; then
    ./ocsstore-linux-x64/ocsstore
elif [ -f './usr/local/lib/ocsstore-linux-x64/ocsstore' ]; then
    ./usr/local/lib/ocsstore-linux-x64/ocsstore
elif [ -f './usr/lib/ocsstore-linux-x64/ocsstore' ]; then
    ./usr/lib/ocsstore-linux-x64/ocsstore
elif [ -f '/usr/local/lib/ocsstore-linux-x64/ocsstore' ]; then
    /usr/local/lib/ocsstore-linux-x64/ocsstore
elif [ -f '/usr/lib/ocsstore-linux-x64/ocsstore' ]; then
    /usr/lib/ocsstore-linux-x64/ocsstore
else
    exit 1
fi
