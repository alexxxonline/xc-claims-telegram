#!/bin/bash

#Path configure
OLD=/path/to/claims/log.txt
NEW=/path/to/claims/log2.txt
OUT=/path/to/claims/out.txt

# database configure
USERNAME="db_user"
PASSWORD="db_pass"
DATABASE="db"

# date *later use
DATETIME=$(date +%F_%T)
DATE=$(date +"%Y-%m-%d")

#Fetching the table and dumps it to $OLD
while read -r output;
do
    echo "$output"
    "$output"  &>> log.txt
done< <(mysql -u$USERNAME -p$PASSWORD $DATABASE -e "select * from mag_claims;" 2>&1  > $OLD)
sleep 1s;

if

#Comparing the files $NEW with $OLD
	 cmp -s "$NEW" "$OLD";  then
		echo "Nothing";

else
#If new claims are found 
		echo "New"
		#Add new claims to $OUT for telegram-send
		sed 's#[^^]#[&]#g;s#\^#\\^#g;s#^#/^#;s#$#$/d#' $NEW | sed -f- $OLD >> $OUT
		#Add new file to $NEW for the next comparison
		sed 's#[^^]#[&]#g;s#\^#\\^#g;s#^#/^#;s#$#$/d#' $NEW | sed -f- $OLD >> $NEW
		#Send the new claims to telegram
		tail $OUT | sed 's/^/['CLAIM'] /' 2>&1 | telegram-send -g --pre --stdin
		#Cleaning
			rm -rf $OUT
				touch $OUT
fi
