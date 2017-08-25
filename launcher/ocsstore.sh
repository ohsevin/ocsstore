#!/bin/bash

APPDIR="$(dirname "$(readlink -f "${0}")")"

if [ -f "${APPDIR}/ocsstore-linux-x64/ocsstore" ]; then
    ${APPDIR}/ocsstore-linux-x64/ocsstore
elif [ -f "${APPDIR}/usr/local/lib/ocsstore-linux-x64/ocsstore" ]; then
    ${APPDIR}/usr/local/lib/ocsstore-linux-x64/ocsstore
elif [ -f "${APPDIR}/usr/lib/ocsstore-linux-x64/ocsstore" ]; then
    ${APPDIR}/usr/lib/ocsstore-linux-x64/ocsstore
elif [ -f '/usr/local/lib/ocsstore-linux-x64/ocsstore' ]; then
    /usr/local/lib/ocsstore-linux-x64/ocsstore
elif [ -f '/usr/lib/ocsstore-linux-x64/ocsstore' ]; then
    /usr/lib/ocsstore-linux-x64/ocsstore
else
    exit 1
fi
