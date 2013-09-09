#!/bin/sh
#count number spot of assignment
cnt="1"
#loop through first line only for assignment
for i in $(head -n 1 students.csv)
do
	if [ $i = "$2," ]
	then 
		break
	else
		#check if i is last value (to avoid comma for loop problem)
		if [ $cnt = $(head -n 1 students.csv | wc -w) ]
		then
			break
		else
			cnt=$(($cnt + 1))
		fi
	fi
done

#count number spot of pennkey
m=$(grep -n "$1" students.csv | cut -f1 -d:)
echo "Please enter the grade."
read input
#Check if input is null/empty
if [ -z "$input" ]
then
	echo "No argument supplied"
else
	#replace grade from input
	sed -e ''"$m"'s/[^ ]*/'"$input"'/'"$cnt"'' students.csv > students.new.txt
cat students.new.txt > students.csv
fi
