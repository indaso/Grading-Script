#!/bin/sh

#output first line of students.csv into temp file
echo -n "$(head -n 1 students.csv)" > students.txt
#add assignment onto end of first line
echo ", $1" >> students.txt

echo "Please enter the max score for this assignment."
read input
#get max score
echo -n "$(sed -n "2"'p' students.csv)" >> students.txt
#add max score onto end of second line
echo ", $input" >> students.txt
#add rest of file from students.csv
#add score of zero for each student as placeholder
count=$(cat students.csv | wc -l)
for i in $(seq 3 $count)
do
	echo -n "$(sed -n "$i"'p' students.csv)" >> students.txt
	echo -n ", 0" >> students.txt
	echo >> students.txt
done
cat students.txt > students.csv
