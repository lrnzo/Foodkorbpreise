#!/bin/sh

while read LINE
	do echo "$LINE" | cut -f1
done < Artikelnummern-bode.csv
