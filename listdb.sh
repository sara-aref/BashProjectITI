#!/bin/bash

echo -e "\033[1;33mDataBases: \033[0m"
ls -F "$(pwd)" | grep /$ | sed 's#/$##' | while read -r folder; do echo -e "\033[1;32m$folder\033[0m"; done

