#!/bin/bash

read -p "Enter DataBase name you want to connect: " name

if [ ! -d "$name" ]; then
	echo "Error! No DataBase with that name."
else
	cd `pwd`/"$name"

	source ../../table.sh
fi

