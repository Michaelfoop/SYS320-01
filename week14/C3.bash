#!/bin/bash

file="report.txt"

{
	echo "<html>"
	echo "<head><title>Access Logs with IOC indicators</title></head>"
	echo "<body>"
	echo "<h2>Access logs with IOC indicators:</h2>"
	echo "<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">"

	while read -r ip dt page; do
		[ -z "$ip" ] && continue
		echo "<tr><td>$ip</td><td>$dt</td><td>$page</td></tr>"
	done < "$file"

	echo "</table>"
	echo "</body>"
	echo "</html>"
} > /var/www/html/report.html
