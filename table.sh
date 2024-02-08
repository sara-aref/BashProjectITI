#!/bin/bash

continue=true

while [[ "$continue" == true ]]; do

	select table in createtable droptable inserttable selectfromtable deletefromtable updatetable listtable exit
	do
		case $table in
			"createtable")
				source ../../createTable.sh
				break
			;;
			"droptable")
				source ../../droptable.sh
				break
			;;
			"inserttable")
				source ../../inserttable.sh
				break
			;;
			"selectfromtable")
				source ../../selectfromtable.sh
				break
			;;
			"deletefromtable")
				source ../../deletefromtable.sh
				break
			;;
			"updatetable")
				source ../../updateTable.sh
				break
			;;
			"listtable")
				source ../../listTable.sh
				break
			;;
			"exit")
        			exit
        		;;
			*)
				echo -e "\033[1;31mwrong! Choose from the list\033[0m"

				break
			;;
		esac
	done
done
