#! /bin/bash

shopt -s extglob #turn on pattern and enable it

read -p "Enter Table name you want to connect: " name

if [ ! -f "$name" ]; then
	echo "Error! No Table with that name."
	
elif [[ $name == "" ]]; then
   echo You didnt enter any value
	
else
	rm "$name"
	echo "Table is deleted"
fi
