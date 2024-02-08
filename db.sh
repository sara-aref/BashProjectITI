#!/bin/bash

dbname=databaseso
if [ -d $dbname ]; then
	pwd
else
	mkdir `pwd`/$dbname
fi

cd `pwd`/$dbname

continue=true

while [[ "$continue" == true ]]; do

	select db in createdb listdb dropdb connectdb exit
	do      
        	case $db in
        	"createdb")
        		source ../createDB.sh
        		break
        	;;
        	"listdb")
        		source ../listdb.sh
        		break
        	;;
        	"dropdb")
        		source ../dropDB.sh
        		break
        	;;
        	"connectdb")
        		source ../connectdb.sh
        		break
        	;;
        	"exit")
        		exit
        	;;
        	*)
        		echo -e "\033[1;31mrong! Choose from the list\033[0m"
        		break;
        	;;
        	esac
	done
done
cd ..
