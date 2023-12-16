#! /usr/bin/bash

shopt -s extglob #turn on pattern and enable it

read -p "Enter the Database name you want to drop " nameDB


if [ -d database/"$nameDB" ]; then
    rm -r database/"$nameDB"
    echo "Directory deleted successfully."
else
    echo "Directory does not exist."
fi


