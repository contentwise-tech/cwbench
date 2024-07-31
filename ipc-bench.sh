#!/bin/sh
# (c) 2024 Contentwise Tech
# https://contentwise.tech
# MIT License

if [ ! -e "./.pkgmng" ]; then
./scripts/gen-settings.sh
fi

PKGMNG=`cat ./.pkgmng`
LNAME=`cat ./.unqid`

sudo $PKGMNG install -y git cmake

mkdir -p ./logs
OURDIR=`pwd`
cd ~/
git clone https://github.com/rigtorp/ipc-bench.git
cd ./ipc-bench
mkdir build
cd ./build
cmake ..
make
cp $OURDIR/scripts/run-ipc-bench.sh ./
chmod 755 ./run-ipc-bench.sh
./run-ipc-bench.sh $LNAME
cp ./*.log $OURDIR/logs/
