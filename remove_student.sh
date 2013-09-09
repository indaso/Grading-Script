#!/bin/sh

remove () {
	sed '/'"$1"'/d' students.csv | sed 's/^$//g' > tmp
	mv tmp students.csv
}
#Check if input is null/empty 
if [ -z "$1" ]
  then
	  echo "No argument supplied"
  else     
#prompt
while true; do
	read -p "Do you wish to delete this student? " yn
	case $yn in
	[Yy]* ) remove $1; break;;
	[Nn]* ) exit;;
* ) echo "Please answer yes or no.";;
esac
done
fi
