#!/bin/bash

echo -e "\033[1;33mEnter DataBase name you want to connect: \033[0m" && read -p "" name

if [ ! -d "$name" ]; then
	echo -e "\033[1;31mError! No DataBase with that name.\033[0m"
else
	cd `pwd`/"$name"

	source ../../table.sh
fi

