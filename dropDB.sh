#! /usr/bin/bash

shopt -s extglob #turn on pattern and enable it

read -p "Enter the Database name you want to drop: " nameDB


if [ -d "$nameDB" ]; then
    rm -r "$nameDB"
    echo "Directory deleted successfully."
    
elif [[ $nameDB == "" ]]; then
   echo You didnt enter any value
   
else
    echo "Directory does not exist."
    
fi


