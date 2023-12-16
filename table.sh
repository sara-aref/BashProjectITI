#!/bin/bash

select table in createtable droptable inserttable selectfromtable deletefromtable updatetable listtable
	do
		case $table in
			"createtable")

			;;
			"droptable")

			;;
			"inserttable")
				source ../../inserttable.sh
			;;
			"selectfromtable")
				source ../../selectfromtable.sh
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
