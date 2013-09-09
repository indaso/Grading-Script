#!/bin/sh

add () {
	echo -n "$1, $2, $3" >> students.csv
}

add $1 $2 $3

count=$(head -n 1 students.csv |wc -w)
for i in $(seq 4 $count)
do
	echo -n ", 0" >> students.csv
done
echo >> students.csv
