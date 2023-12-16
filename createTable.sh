#! /usr/bin/bash

shopt -s extglob #turn on pattern and enable it

read -p "Enter the Table name: .. It shouldn't start with number and must not include any special character or space: " nameTable
if [ ! -f "$nameTable" ]; then

    case $nameTable in
         [a-zA-Z_]*)
         nameTable=$(echo "databaseso/$nameTable" | tr ' ' '_')
         ## when added the touch command here, if the user ended the program the file will be empty
         
         
         count=0
         dataType= true
         conf= x
         txt=""
         txtType=""
         read -p "Enter the number of columns: " col
         while [ $count -le $col ]; do
               while [ $conf != "Y" -a $conf != "y" ]; do
                     read -p "Please write Y or y to confirm that you are going to write next the primary key nameTable" conf
               done
               read -p "Enter the name of column number $count: " colName
               read -p "Enter the Type of column 'int' or 'string': " colType
               if [ $count == 0 ]; then
               txt=$colName":"
               txtType=$colType":"
               else
               txt=$txt$colName":"
               txtType=$txtType$colType":"
               fi  
               ((count++))
        done
        touch $nameTable
        echo Table is added successfully
        echo "$txtType"
        printf "$txt\n$txtType\n" > $nameTable  
         
         ;;
         
         [0-9]*)
         echo Incorrect Input remove the number at the beginning
         ;;
         
         *)
         echo Incorrect Table name
         ;;
         esac
elif [[ $nameTable = "" ]]; then
   echo You didnt enter any value
else
    echo Table doesnt exist
fi



          
          
          
          
          
          
          
          
          
      
      
