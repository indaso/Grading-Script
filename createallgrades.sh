#!/bin/sh
OLDIFS=$IFS
IFS=,
firstline=$(cat students.csv | head -1)
secondline=$(cat students.csv | head -2 | tail -1)
#echo $firstline
#echo $secondline
titlecount=-3
for title in $firstline
do
  if [ $titlecount -ge 0 ] && [ $title = " $1" ]
  then 
    mkdir $1
    while read pennkey lastname firstname line
    do
      if [ "$pennkey" != "PENNKEY" ]
      then
        #found the right student
        COUNT=0
        for arg in $line
        do
          if [ $((COUNT)) = $((titlecount)) ]
          then
          #found the right assignment
            maxcount=-3
            for max in $secondline
            do
              if [ $((maxcount)) = $((COUNT)) ]
              then 
                grademax=$max 
              fi
              maxcount=$((maxcount+1))
            done
            grade=$arg
            grade=$(echo $grade | tr -d ' ')
          fi
          COUNT=$((COUNT+1))
         
        done
        firstname=$(echo $firstname | tr -d ' ')
        echo "$firstname$lastname ($pennkey)" >> $1/${pennkey}_$1_$grade
        echo $1 >> $1/${pennkey}_$1_$grade
        echo "Grade: $grade /$grademax" >> $1/${pennkey}_$1_$grade
      fi
    done < students.csv
  else
    titlecount=$((titlecount+1))
  fi
done

IFS=$OLDIFS
