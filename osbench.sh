#!/bin/sh
# (c) 2024 Contentwise Tech
# https://contentwise.tech
# MIT License

if [ ! -e "./.pkgmng" ]; then
./scripts/gen-settings.sh
fi

PKGMNG=`cat ./.pkgmng`
LNAME=`cat ./.unqid`
sudo $PKGMNG install -y git meson ninja-build

mkdir -p ./logs
OURDIR=`pwd`
cd ~/
git clone https://gitlab.com/mbitsnbites/osbench
cd ./osbench
mkdir out
cd out
meson --buildtype=release ../src
ninja
cp $OURDIR/scripts/run-osbench.sh ./
chmod 755 ./run-osbench.sh
./run-osbench.sh $LNAME
cp ./*.log $OURDIR/logs/
