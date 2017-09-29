#!/bin/bash

PREFIX="$(cd "$(dirname "${0}")" && pwd)/"

if [ "${APPIMAGE}" ]; then
    if [ "${1}" = '--install' ]; then
        mkdir -p ${HOME}/.local/share/applications
        mkdir -p ${HOME}/.local/bin

        sed -e "s|Exec=ocsstore|Exec=${HOME}/.local/bin/ocsstore|" \
            -e "s|Icon=ocsstore|Icon=${HOME}/.local/share/applications/ocsstore.svg|" \
            ${PREFIX}ocsstore.desktop > ${HOME}/.local/share/applications/ocsstore.desktop
        chmod 644 ${HOME}/.local/share/applications/ocsstore.desktop
        install -D -m 644 ${PREFIX}ocsstore.svg ${HOME}/.local/share/applications/ocsstore.svg
        update-desktop-database ${HOME}/.local/share/applications

        ln -sf ocsstore-appimage ${HOME}/.local/bin/ocsstore
        install -D -m 755 ${PREFIX}ocsstore-appimage ${HOME}/.local/bin/ocsstore-appimage
        install -D -m 755 "${APPIMAGE}" ${HOME}/.local/bin/ocsstore.AppImage
        rm "${APPIMAGE}"

        exit 0
    elif [ "${1}" = '--uninstall' ]; then
        rm ${HOME}/.local/share/applications/ocsstore.desktop
        rm ${HOME}/.local/share/applications/ocsstore.svg
        update-desktop-database ${HOME}/.local/share/applications

        unlink ${HOME}/.local/bin/ocsstore
        rm ${HOME}/.local/bin/ocsstore-appimage
        rm ${HOME}/.local/bin/ocsstore.AppImage

        exit 0
    fi
fi

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
