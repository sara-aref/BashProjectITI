#! /usr/bin/bash

shopt -s extglob 


echo The tables are: 
ls -l


read -p "Enter the Table name that you want to update: " nameTable

if [ ! -f "$nameTable" ]; then
        echo "Table not found"
        return
fi

read -p "Enter the column name you want to update in: " colName

if [[ $colName = "" ]]; then
	echo No value entered
	return
fi

col=$(awk 'BEGIN{FS=":"}{if(NR==1){for(i=1;i<=NF;i++){if($i=="'$colName'") print i}}}' $nameTable)
if [[ $col -eq 1 ]]; then
	echo This is a primary key we cant update it
	return
fi
   
            read -p "Enter the value in the column you want to update: " val           
            rowNums=$(awk -v col="$col" -v val="$val" -v nameTable="$nameTable" 'BEGIN{FS=":"}{if ($col==val && NR>=3) print NR}' "$nameTable")
            
               read -p "Enter the new value here: " val2

		for rowNum in $rowNums; do
       			 oldrecord=$(awk -v r="$rowNum" -v c="$col" 'BEGIN{FS=":"}{if(NR==r){print $c}}' "$nameTable")
     			 sed -i "${rowNum}s/$oldrecord/$val2/g" "$nameTable"
     			 
     		done
               
