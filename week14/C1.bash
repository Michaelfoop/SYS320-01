#!/bin/bash

page=$(curl -s http://10.0.17.47/IOC.html)

words=$(echo "$page" | grep -o '<td>[^<]*</td>' \
| sed 's/<td>//; s@</td>@@' \
| sed -n '1~2p')

echo "$words" > IOC.txt
