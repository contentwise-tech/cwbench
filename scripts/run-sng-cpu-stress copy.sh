#!/bin/sh
# (c) 2024 Contentwise Tech
# https://contentwise.tech
# MIT License

CORES=`grep 'cpu cores' /proc/cpuinfo | uniq`

date > $1
echo Default test on all cores for 1 minute
stress-ng --cpu $CORES --timeout 60s --log-file ./dump.txt
cat ./dump.txt >> $1
date >> $1

echo stress CPU throttling gradually from 10 to 100% and back all cores
for i in {10 20 30 40 50 60 70 80 90 100 90 80 70 60 50 40 30 20 10}
do
  date >> $1
  stress-ng --cpu $CORES --cpu-load $i --cpu-method fft --timeout 20s --log-file ./dump.txt
  cat ./dump.txt >> $1
  rm ./dump.txt
done
