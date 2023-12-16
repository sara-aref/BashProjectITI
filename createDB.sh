#! /usr/bin/bash

shopt -s extglob #turn on pattern and enable it

read -p "Enter the Database name: .. It shouldn't start with number and must not include any special character or space: " nameDB

case $nameDB in

[a-zA-Z_]*)
mkdir database/$nameDB
;;

[0-9]*)
echo Incorrect Input remove the number at the beginning
;;
[*" "*])
nameDB=$(echo "database/$nameDB" | tr ' ' '_')
mkdir database/$nameDB
echo nameDB
;;

*)
echo Incorrect DB name
;;
esac 
