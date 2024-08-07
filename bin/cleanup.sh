#!/bin/sh
if [ $# -ne 2 ]; then
    echo "Usage: $0 <lang> <logfile>"
    exit 1
fi

lang=$1
logfile=$2

git clean -fxd
echo "$lang done" >> "$logfile"
df -h | grep root | awk '{print "Free space: " $4}' | tee -a "$logfile"
