#!/bin/bash

file="/var/log/apache2/access.log"

function countingCurlAccess(){
weirdAl=$(cat "$file" | cut -d' ' -f1,12 | grep "curl" | sort | uniq -c)
}

countingCurlAccess
echo "$weirdAl"
