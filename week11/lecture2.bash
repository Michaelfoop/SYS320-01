#!/bin/bash

allLogs=""
file="/var/log/apache2/access.log"

function pagecount(){
bigJohn=$(cat "$file" | cut -d' ' -f7 | sort | uniq -c)
}

pagecount
echo "$bigJohn"
