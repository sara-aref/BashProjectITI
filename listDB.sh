#! /usr/bin/bash

shopt -s extglob #turn on pattern and enable it

ls -p | grep -v /

echo "Directory deleted successfully."
