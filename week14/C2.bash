#!/bin.bash

log="$1"
ioc="$2"

:> "report.txt"

while read -r line; do
	page=$(echo "$line" | cut -d' ' -f7)

	while read -r line2; do
		[ -z "$line2" ] && continue
		echo "$page" | grep -q "$line2" || continue

		ip=$(echo "$line" | awk '{print $1}')
		dt=$(echo "$line" | awk '{print $4}' | sed 's/^\[//; s/\]$//')
		echo "$ip $dt $page" >> report.txt
		break
	done < "$ioc"
done < "$log"
