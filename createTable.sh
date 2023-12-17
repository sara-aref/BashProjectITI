#! /usr/bin/bash

shopt -s extglob #turn on pattern and enable it

read -p "Enter the Table name: .. It shouldn't start with number and must not include any special character or space: " nameTable
if [ ! -f "$nameTable" ]; then

    case $nameTable in
         *['!''?'@\#\$%^\&*()-+\.\/';']*)
         echo Incorrect DB name
         ;;
         
         [a-zA-Z_]*)
         nameTable=$(echo "$nameTable" | tr ' ' '_')
         ## when added the touch command here, if the user ended the program the file will be empty
         
         
         count=0
         index=1
         dataType= true
         txt=""
         txtType=""
         colType=0
         read -p "Enter the number of columns: " col
         while [ $count -lt $col ]; do
               read -p "Enter the name of column number $index: " colName
               
               if [ $colName ]; then
   
                   read -p "Enter the Type of column 'int' or 'string': " colType
                   if [ $colType ]; then
                       if [[ $count == 0 ]]; then
                       
                          echo Table is in progress successfully
                           txt=$colName":"
                           txtType=$colType":"
                       else
                           txt=$txt$colName":"
                           txtType=$txtType$colType":"
                       fi  
                  else
                      echo Invalid value
                      break
                  fi
               else
                    echo You didnt enter any value
                    break
               fi
               ((count++))
               ((index++))
        done
        touch $nameTable

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
  
   
