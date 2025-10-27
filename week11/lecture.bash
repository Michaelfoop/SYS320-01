#!/bin/bash

file="/var/log/apache2/access.log"

results=$(cat "$file" | cut -d' ' -f1,7 | grep ".html" | tr -d "/")
echo "$results"

