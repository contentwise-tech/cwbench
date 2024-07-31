#!/bin/sh
# (c) 2024 Contentwise Tech
# https://contentwise.tech
# MIT License

LNAME="osbench-$1.log"
DT=`date`

echo osbench executed at $DT > $LNAME
cat /proc/cpuinfo | grep name | head -1 >> $LNAME
uname -v >> $LNAME
echo " " >> $LNAME

./create_threads >> $LNAME
./create_processes >> $LNAME
./launch_programs >> $LNAME
./create_files ./ >> $LNAME
./mem_alloc >> $LNAME
