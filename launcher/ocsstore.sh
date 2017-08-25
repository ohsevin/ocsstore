#!/bin/bash

PWD="$(cd "$(dirname "${0}")/../" && pwd)"

if [ -f "${PWD}/ocsstore-linux-x64/ocsstore" ]; then
    ${PWD}/ocsstore-linux-x64/ocsstore
elif [ -f "${PWD}/usr/local/lib/ocsstore-linux-x64/ocsstore" ]; then
    ${PWD}/usr/local/lib/ocsstore-linux-x64/ocsstore
elif [ -f "${PWD}/usr/lib/ocsstore-linux-x64/ocsstore" ]; then
    ${PWD}/usr/lib/ocsstore-linux-x64/ocsstore
elif [ -f '/usr/local/lib/ocsstore-linux-x64/ocsstore' ]; then
    /usr/local/lib/ocsstore-linux-x64/ocsstore
elif [ -f '/usr/lib/ocsstore-linux-x64/ocsstore' ]; then
    /usr/lib/ocsstore-linux-x64/ocsstore
else
    exit 1
fi
