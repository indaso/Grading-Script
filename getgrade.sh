#!/bin/sh
OLDIFS=$IFS
IFS=,
firstline=$(cat students.csv | head -1)
secondline=$(cat students.csv | head -2 | tail -1)
#echo $firstline
#echo $secondline
while read pennkey lastname firstname line
do
  if [ $pennkey = $1 ]
  then
    echo "$firstname $lastname ($pennkey)"
    COUNT=3
    totalmax=0
    totalgrade=0
    for arg in $line
    do
     
      totalgrade=$((totalgrade+arg))
      titlecount=0
      for title in $firstline
      do
        if [ $((titlecount)) = $((COUNT)) ]
        then 
           gradelabel=$title
        fi
        titlecount=$((titlecount+1))
      done
      maxcount=0
      for max in $secondline
      do
        if [ $((maxcount)) = $((COUNT)) ]
        then 
           maxlabel=$max
           totalmax=$((totalmax+max))
        fi
        maxcount=$((maxcount+1))
      done
      echo "$gradelabel: $arg/$maxlabel"
      COUNT=$((COUNT+1))
      #echo $COUNT
    done
    echo "Total: $totalgrade/$totalmax"
  fi
done < students.csv

IFS=$OLDIFS
