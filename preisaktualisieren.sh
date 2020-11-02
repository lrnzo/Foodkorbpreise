#!/bin/sh
while read LINE
	do myvar=$(echo "$LINE" | cut -f1 -d' ')
	if [ "$myvar" = "Artnr" ]; then
		echo "$LINE $(date +%Y%m%d)" >> tmp.csv
	else
		wget -qO "$myvar" --load-cookies=cookies.txt https://www.bodenaturkost.de/Produkt/4/"$myvar"
		grundpreis_alt=$(echo "$LINE" | rev | cut -f1 -d' ' | rev)
		grundpreis_neu=$(grep -A10 "id=\"tab-$myvar" "$myvar" | grep -oE 'Grundpreis: [0-9,]* ' | grep -oE '[0-9,]*')
		echo "$LINE $grundpreis_neu" >> tmp.csv
		if [ "$grundpreis_alt" != "$grundpreis_neu" ]; then
			echo neuer Grundpreis bei "$myvar"!
		fi
	fi
done < Artikelnummern-bode.csv
mv tmp.csv Artikelnummern-bode.csv
