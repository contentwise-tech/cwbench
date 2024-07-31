#!/bin/sh
# (c) 2024 Contentwise Tech
# https://contentwise.tech
# MIT License

date > $1
echo Storage test 
stress-ng --iomix 2 --iomix-bytes 1m -t 60s -v --log-file ./dump.txt
cat ./dump.txt >> $1
rm ./dump.txt
