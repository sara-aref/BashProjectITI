#! /usr/bin/bash

shopt -s extglob #turn on pattern and enable it


echo -e "\033[1;33mEnter the Database name: .. It shouldn't start with number and must not include any special character or space: \033[0m" && read -p "" nameDB

if [[ $nameDB = "" ]]; then
	echo -e "\033[1;31mYou didn't enter any value\033[0m"
   
elif [ ! -d "$nameDB" ]; then

    case $nameDB in
         *['!''?'@\#\$%^\&*()-+\.\/';']*)
         echo -e "\033[1;31mIncorrect Database name\033[0m"
         ;;
         
         [a-zA-Z_]*)
         nameDB=$(echo "$nameDB" | tr ' ' '_')
         mkdir $nameDB
         echo -e "\033[1;32mDatabase created\033[0m"
         ;;
         
         [0-9]*)
         echo -e "\033[1;31mIncorrect Input remove the number at the beginning\033[0m"
         ;;
         
         *)
         echo -e "\033[1;31mIncorrect Database name\033[0m"
         ;;
         esac
   
else 
   echo -e "\033[1;31mInvalid Input Database already exists\033[0m"
   
fi
