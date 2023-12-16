#!/bin/bash

select table in createtable droptable inserttable selectfromtable deletefromtable updatetable listtable
	do
		case $table in
			"createtable")
				source ../../createTable.sh
			;;
			"droptable")
				source ../../droptable.sh
			;;
			"inserttable")
				source ../../inserttable.sh
			;;
			"selectfromtable")
				source ../../selectfromtable.sh
			;;
			"deletefromtable")
				source ../../deletefromtable.sh
			;;
			"updatetable")
				source ../../updateTable.sh
			;;
			"listtable")
				source ../../listTable.sh
			;;
			*)
				echo "wrong! Choose from the list"
			;;
		esac
	done
