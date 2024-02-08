#! /usr/bin/bash

shopt -s extglob #turn on pattern and enable it

echo -e "\033[1;33mEnter the Database name you want to drop: \033[0m" && read -p "" nameDB


if [ -d "$nameDB" ]; then
    rm -r "$nameDB"
    echo -e "\033[1;32mDatabase deleted successfully.\033[0m"
    
elif [[ $nameDB == "" ]]; then
    echo -e "\033[1;31mYou didn't enter any value\033[0m"
   
else
    echo -e "\033[1;31mDatabase does not exist.\033[0m"
    
fi


