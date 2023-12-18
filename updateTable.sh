#! /usr/bin/bash

shopt -s extglob 
#turn on pattern and enable it

check=1
val=0
echo The tables are: 
ls -l

read -p "Enter the Table name that you want to update: " nameTable

read -p "Enter the column name you want to update in: " colName



col=$(awk 'BEGIN{FS=":"}{if(NR==1){for(i=1;i<=NF;i++){if($i=="'$colName'") print i}}}' $nameTable)

 


            read -p "Enter the value in the column you want to update: " val
            rowNum=$(awk -v col="$col" -v val="$val" -v nameTable="$nameTable" 'BEGIN{FS=":"}{if ($col==val && NR==3) print NR}' "$nameTable")
            if [[ $col -eq 1 ]]; then
               echo This is a primary key we cant update it
            else
               read -p "Enter the new value here: " val2
               col2=$(awk 'BEGIN{FS=":"}{if(NR==1){for(i=1;i<=NF;i++){if($i=="'$val2'") print i}}}' "$nameTable")
               oldrecord=$(awk 'BEGIN{FS=":"}{if(NR=='$rowNum'){for(i=1;i<=NF;i++){if(i=='$col') print $i}}}' "$nameTable")
               sed -i ''$rowNum's/'$oldrecord'/'$val2'/g' $nameTable
            fi

        
