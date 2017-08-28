#!/bin/bash

PREFIX="$(cd "$(dirname "${0}")" && pwd)/"

if [ -f "${PREFIX}ocsstore-linux-x64/ocsstore" ]; then
    ${PREFIX}ocsstore-linux-x64/ocsstore
elif [ -f "${PREFIX}../lib/ocsstore-linux-x64/ocsstore" ]; then
    ${PREFIX}../lib/ocsstore-linux-x64/ocsstore
elif [ -f "${PREFIX}usr/local/lib/ocsstore-linux-x64/ocsstore" ]; then
    ${PREFIX}usr/local/lib/ocsstore-linux-x64/ocsstore
elif [ -f "${PREFIX}usr/lib/ocsstore-linux-x64/ocsstore" ]; then
    ${PREFIX}usr/lib/ocsstore-linux-x64/ocsstore
elif [ -f '/usr/local/lib/ocsstore-linux-x64/ocsstore' ]; then
    /usr/local/lib/ocsstore-linux-x64/ocsstore
elif [ -f '/usr/lib/ocsstore-linux-x64/ocsstore' ]; then
    /usr/lib/ocsstore-linux-x64/ocsstore
else
    exit 1
fi
