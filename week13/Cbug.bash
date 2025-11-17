#! /bin/bash

link="10.0.17.47/Assignment.html"
fullPage=$(curl -sL "$link")


temp=$(echo "$fullPage" | \
xmlstarlet format --html --recover 2>/dev/null | \
xmlstarlet select -t -m "//html//body//table[@id='temp']//tr" -v "td[1]" -o " " -v "td[2]" -n)


press=$(echo "$fullPage" | \
xmlstarlet format --html --recover 2>/dev/null | \
xmlstarlet select -t -m "//html//body//table[@id='press']//tr" -v "td[1]" -o " " -v "td[2]" -n)

paste -d ' ' <(echo "$press" | cut -d' ' -f1) <(echo "$temp")
