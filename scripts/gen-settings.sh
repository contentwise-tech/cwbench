#!/bin/sh
# (c) 2024 Contentwise Tech
# https://contentwise.tech
# MIT License

echo generating settings...
# Set package manager
DISTRO=`uname -v`
PKGMNG=''
case "$DISTRO" in
  *Debian*) PKGMNG='apt' ;;
  *Ubuntu*) PKGMNG='apt' ;;
  *FreeBSD*) PKGMNG='pkg' ;;
  *      ) echo "Unsupported OS" ;;
esac
echo $PKGMNG > ./.pkgmng

CPU=`cat /proc/cpuinfo | grep name | head -1 | awk '{print $NF}'`
MACH=`uname -n`
SDT=`date -I`
echo "$MACH-$CPU-$SDT" > ./.unqid
