#! /usr/bin/bash

shopt -s extglob #turn on pattern and enable it

echo -e "\033[1;33mTables:\033[0m"

ls -l | grep "^-" | awk '{print $NF}' | while read -r file; do echo -e "\033[1;32m$file\033[0m"; done

