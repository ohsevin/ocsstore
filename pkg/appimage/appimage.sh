#!/bin/sh

PKGNAME='ocsstore'
PKGVER='0.0.0'
PKGREL='1'

curl -L -o appimagetool "https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage"
chmod 755 appimagetool
./appimagetool --appimage-extract

make ocsmanager_build="appimage"
make DESTDIR="${PKGNAME}.AppDir" prefix="/usr" install

cp ${PKGNAME}.AppDir/usr/bin/${PKGNAME} ${PKGNAME}.AppDir/AppRun
cp ${PKGNAME}.AppDir/usr/share/applications/${PKGNAME}.desktop ${PKGNAME}.AppDir/${PKGNAME}.desktop
cp ${PKGNAME}.AppDir/usr/share/icons/hicolor/scalable/apps/${PKGNAME}.svg ${PKGNAME}.AppDir/${PKGNAME}.svg

./squashfs-root/AppRun ${PKGNAME}.AppDir

mv *.AppImage ${PKGNAME}-${PKGVER}-${PKGREL}-x86_64.AppImage
