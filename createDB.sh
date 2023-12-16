#! /usr/bin/bash

shopt -s extglob #turn on pattern and enable it

#nameDB=$(echo "database/$nameDB" | tr ' ' '_')
#mkdir database/$nameDB
#echo nameDB

read -p "Enter the Database name: .. It shouldn't start with number and must not include any special character or space: " nameDB

if [ ! -d database/"$nameDB" ]; then

    case $nameDB in
         [a-zA-Z_]*)
         mkdir database/$nameDB
         ;;
         
         [0-9]*)
         echo Incorrect Input remove the number at the beginning
         ;;
         
         [*" "*])
         newDB=$(echo "database/$nameDB" | tr ' ' '_')
         mv "database/$nameDB" "$newDB"
         ;;
         
         *)
         echo Incorrect DB name
         ;;
         esac
   echo Invalid Input Database already exists
elif [[ $nameDB = "" ]]; then
   echo You didnt enter any value
fi
