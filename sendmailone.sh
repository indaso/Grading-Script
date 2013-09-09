#!/bin/sh

randQuote () {
	rand=`tr -cd 0-9 </dev/urandom | head -c 3`
	rand=$((rand%265))
        rand=`echo $rand | sed 's/^0*//'`
	OLDIFS=$IFS
	IFS=\"

	COUNT=0
	while read quote 
	do
		#echo $rest
		if [ $((COUNT)) = $((rand)) ] 
		then
	    echo $quote
	  fi
	  COUNT=$((COUNT+1))
	done < Quotes.txt
}

( cat $2/$1_$2_* ; randQuote ) > Grade
echo "Your grade is attached to this mail." | mail -a Grade -s "CIS 191 $2 Grade" $1@seas.upenn.edu
rm Grade


