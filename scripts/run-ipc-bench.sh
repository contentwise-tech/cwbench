#!/bin/sh
# (c) 2024 Contentwise Tech
# https://contentwise.tech
# MIT License

LNAME="ipc_bench-$1.log"
DT=`date`

echo ipc_bench executed at $DT > $LNAME
cat /proc/cpuinfo | grep name | head -1 >> $LNAME
uname -v >> $LNAME
echo " " >> $LNAME

TESTS="./pipe_lat ./pipe_thr ./unix_lat ./unix_thr ./tcp_lat ./tcp_thr ./udp_lat"
# "./tcp_local_lat ./tcp_remote_lat"
for CMD in $TESTS
do
  echo $CMD
  for x in {16 512 1024}
  do
    $CMD $x 1000 >> $LNAME
  done
done
