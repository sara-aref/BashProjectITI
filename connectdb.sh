#!/bin/bash

cd `pwd`/database

read -p "Enter DataBase name you want to connect: " name

if [ ! -d "$name" ]; then
	echo "Error! No DataBase with that name."
else
	cd `pwd`/"$name"

	select table in createtable droptable inserttable selectfromtable deletefromtable updatetable listtable
	do
		case $table in
			"createtable")
			
			;;
			"droptable")
			
			;;
			"inserttable")
			
			;;
			"selectfromtable")
			
			;;
			"deletefromtable")
			
			;;
			"updatetable")
			
			;;
			"listtable")
			
			;;
			*)
				echo "wrong! Choose from the list"
			;;
		esac
	done
fi
