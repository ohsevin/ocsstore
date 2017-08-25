#!/bin/sh

PKGNAME='ocsstore'

make
make DESTDIR="${PKGNAME}.AppDir" prefix="/usr" install

curl -L -o appimagetool.AppImage "https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage"
chmod 755 appimagetool.AppImage
./appimagetool.AppImage --appimage-extract

./squashfs-root/AppRun ${PKGNAME}.AppDir
