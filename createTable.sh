#! /usr/bin/bash

shopt -s extglob #turn on pattern and enable it

read -p "Enter the Table name: .. It shouldn't start with number and must not include any special character or space: " nameTable
if [ ! -f "$nameTable" ]; then

    case $nameTable in
         [a-zA-Z_]*)
         touch $nameTable
         ;;
         
         [0-9]*)
         echo Incorrect Input remove the number at the beginning
         ;;
         
         *)
         echo Incorrect Table name
         ;;
         esac
         
elif [[ $nameTable = "" ]]; then
   echo You didnt enter any value
   
else 
   echo Invalid Input Database already exists
   
fi
