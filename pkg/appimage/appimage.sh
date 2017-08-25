#!/bin/sh

PKGNAME='ocsstore'

make ocsmanager_build="appimage"
make DESTDIR="${PKGNAME}.AppDir" prefix="/usr" install

cp ${PKGNAME}.AppDir/usr/bin/${PKGNAME} ${PKGNAME}.AppDir/AppRun
cp ${PKGNAME}.AppDir/usr/share/applications/${PKGNAME}.desktop ${PKGNAME}.AppDir/${PKGNAME}.desktop
cp ${PKGNAME}.AppDir/usr/share/icons/hicolor/scalable/apps/${PKGNAME}.svg ${PKGNAME}.AppDir/${PKGNAME}.svg

curl -L -o appimagetool.AppImage "https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage"
chmod 755 appimagetool.AppImage
./appimagetool.AppImage --appimage-extract

./squashfs-root/AppRun ${PKGNAME}.AppDir
