#!/bin/bash

install -d $HOME/.local
cd $HOME/.local
  VERSION=131.0.6778.204
  if [ "$ARCH" = "x86_64" ]
  then
    CPUARCH=x86_64
     [ ! -e ./usr/lib64/chromium/chromium ] && [ ! -e chromium-$VERSION-$CPUARCH-1alien.txz ] && wget http://www.slackware.com/~alien/slackbuilds/chromium/pkg64/15.0/chromium-$VERSION-$CPUARCH-1alien.txz
  else
    CPUARCH=i586
     [ ! -e ./usr/lib64/chromium/chromium ] && [ ! -e chromium-$VERSION-$CPUARCH-1alien.txz ] && wget http://www.slackware.com/~alien/slackbuilds/chromium/pkg/15.0/chromium-$VERSION-$CPUARCH-1alien.txz
  fi
  [ ! -e ./usr/lib64/chromium/chromium ] && [ ! -e chromium-$VERSION-$CPUARCH-1alien.txz ] && exit 2
  [ ! -e usr/lib64/chromium/ ] && tar xJvf chromium-$VERSION-$CPUARCH-1alien.txz
  [ -e chromium-$VERSION-$CPUARCH-1alien.txz ] && rm chromium-$VERSION-$CPUARCH-1alien.txz
  ./usr/lib64/chromium/chromium

exit 0
  install -d $PREFIX
  cp -fR usr/share/* $PREFIX/share
  mv usr/lib64 $PREFIX/lib
  mv usr/lib $PREFIX/
  mkdir $PREFIX/bin
  ln -s $PREFIX/lib/chromium/chromium $PREFIX/bin
  sed -i \
    -e "s@/usr/bin/chromium@chromium@g" \
    "$PREFIX/share/applications/chromium.desktop"

