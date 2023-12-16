#! /usr/bin/bash

shopt -s extglob #turn on pattern and enable it


read -p "Enter the Database name: .. It shouldn't start with number and must not include any special character or space: " nameDB

if [ ! -d database/"$nameDB" ]; then

    case $nameDB in
         [a-zA-Z_]*)
         nameDB=$(echo "databaseso/$nameDB" | tr ' ' '_')
         mkdir $nameDB
         echo DB is added successfully
         ;;
         
         [0-9]*)
         echo Incorrect Input remove the number at the beginning
         ;;
         
         *)
         echo Incorrect DB name
         ;;
         esac

elif [[ $nameDB = "" ]]; then
   echo You didnt enter any value
   
else 
   echo Invalid Input Database already exists
   
fi
