#!/bin/sh
OLDIFS=$IFS
IFS=,
while read pennkey lastname firstname line
  do
    if [ $pennkey != "PENNKEY" ]
    then
    	sh sendmailone.sh $pennkey $1
    fi
  done < students.csv
IFS=$OLDIFS
