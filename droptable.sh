#! /bin/bash

shopt -s extglob #turn on pattern and enable it

read -p "Enter Table name you want to delete: " name

if [ ! -f "$name" ]; then
	echo "Error! No Table with that name."
	
else
	rm "$name"
	echo "Table is deleted"
fi
