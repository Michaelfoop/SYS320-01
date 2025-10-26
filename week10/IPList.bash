#!/bin/bash

[ $# -ne 1 ] && echo "Usage $0 <Prefix>" && exit 1

prefix=$1

[ ${#1} -lt 5 ] && \
printf "Prefix length is too short\nPrefix example: 0.0.0\n" && \
exit 1

for i in {1..254}
do
	ping -c 1 -W 1 $prefix.$i > /dev/null && echo $prefix.$i
done
