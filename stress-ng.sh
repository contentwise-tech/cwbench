#!/bin/sh
# (c) 2024 Contentwise Tech
# https://contentwise.tech
# MIT License

if [ ! -e "./.pkgmng" ]; then
./scripts/gen-settings.sh
fi

PKGMNG=`cat ./.pkgmng`
LNAME=`cat ./.unqid`
LNAME="stress-ng-$LNAME.log"

sudo $PKGMNG install -y stress-ng

mkdir -p ./logs
OURDIR=`pwd`

./scripts/run-sng-cpu-stress.sh ./logs/$LNAME
./scripts/run-sng-disk-stress.sh ./logs/$LNAME
