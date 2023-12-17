#! /usr/bin/bash

shopt -s extglob #turn on pattern and enable it


read -p "Enter the Database name: .. It shouldn't start with number and must not include any special character or space: " nameDB

if [ ! -d "$nameDB" ]; then

    case $nameDB in
         *['!''?'@\#\$%^\&*()-+\.\/';']*)
         echo Incorrect DB name
         ;;
         [a-zA-Z_]*)
         nameDB=$(echo "$nameDB" | tr ' ' '_')
         mkdir $nameDB
         echo "Database created"
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
