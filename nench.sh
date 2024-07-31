#!/bin/sh
# (c) 2024 Contentwise Tech
# https://contentwise.tech
# MIT License

if [ ! -e "./.pkgmng" ]; then
./scripts/gen-settings.sh
fi

PKGMNG=`cat ./.pkgmng`
LNAME=`cat ./.unqid`

sudo $PKGMNG install curl
mkdir -p ./logs

(curl -s wget.racing/nench.sh | bash; curl -s wget.racing/nench.sh | bash) 2>&1 | tee logs/nench-$LNAME.log
