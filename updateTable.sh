#! /usr/bin/bash

shopt -s extglob 
#turn on pattern and enable it

function getNumOfField(){
tableName=$1
namecolumn=$2
name=$(awk -F : -f <(echo 'NR=1{print $NF}') "$tableName")
for ((z=0; z<${#name[@]}; z++)); do
      if [[ "$namecolumn" == "${name[$z]}" ]]; then 
            echo $((z+1))
            break
        fi
done
}

echo The tables are: 
ls -l

read -p "Enter the Table name that you want to update: " nameTable

if [ -f "$nameTable" ]; then
    cat $nameTable
    read -p "Enter the column name: " col
    colCount=$(awk -F: '{if (NR==0) for(i=1;i<=NF;i++) {print $i}}' "$name")
    rowCount=$(awk 'NR >= 3 { for (i = 3; i <= NF; i++) print $i }' "$name")
    
    echo getNumOfField $nameTable $col
    read -p "Enter the value to update in the column: " oldValue
    read -p "Enter the new value name: " newValue
    awk -v lineNumber="$i" -v newValue="$newValue" -F: '{FS=":"} {if (NR==lineNumber) $fieldNumber = newValue} 1'
   awk -v  field=<field_number> -v value=$newValuw '{ if ($field == value) $field = "new_value" }1' file.txt
