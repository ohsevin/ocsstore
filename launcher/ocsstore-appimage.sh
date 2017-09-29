#!/bin/bash

if [ -f "${HOME}/.cache/ocsstore/ocsstore.AppImage" ]; then
    chmod 755 ${HOME}/.cache/ocsstore/ocsstore.AppImage
    ${HOME}/.cache/ocsstore/ocsstore.AppImage --install
fi

if [ -f "${HOME}/.local/bin/ocsstore.AppImage" ]; then
    ${HOME}/.local/bin/ocsstore.AppImage
fi
