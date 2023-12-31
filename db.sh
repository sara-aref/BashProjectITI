#!/bin/bash

dbname=databaseso
if [ -d $dbname ]; then
	pwd
else
	mkdir `pwd`/$dbname
fi

cd `pwd`/$dbname

select db in createdb listdb dropdb connectdb
do      
        case $db in
        "createdb")
        	source ../createDB.sh
        ;;
        "listdb")
        	source ../listdb.sh
        ;;
        "dropdb")
        	source ../dropDB.sh
        ;;
        "connectdb")
        	source ../connectdb.sh
        ;;
        *)
        	echo "Choose from 1 to 4"
        ;;
        esac
done

cd ..
