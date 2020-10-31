#!/bin/sh
rm tmp.csv
while read LINE
	do myvar=$(echo "$LINE" | cut -f1)
	if [ "$myvar" = "Artnr" ]; then
		echo "$LINE $(date +%Y%m%d)" >> tmp.csv
	else 
		echo "$myvar" >> tmp.csv
	fi
done < Artikelnummern-bode.csv
