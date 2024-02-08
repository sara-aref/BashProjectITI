#! /bin/bash

shopt -s extglob #turn on pattern and enable it

echo -e "\033[1;33mEnter Table name you want to delete: \033[0m" && read -p "" name

if [ ! -f "$name" ]; then
	echo -e "\033[1;31mError! No Table with that name.\033[0m"
	
else
	rm "$name"
	echo -e "\033[1;32mTable is deleted\033[0m"
fi
