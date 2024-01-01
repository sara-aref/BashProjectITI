shopt -s extglob #turn on pattern and enable it

read -p "Enter the Table name: .. It shouldn't start with number and must not include any special character or space: " nameTable

if [[ $nameTable = "" ]]; then
   echo You didnt enter any value
elif [ ! -f "$nameTable" ]; then

    case $nameTable in
         *['!''?'@\#\$%^\&*()-+\.\/';']*)
         echo Incorrect DB name
         ;;
         
         [a-zA-Z_]*)
         nameTable=$(echo "$nameTable" | tr ' ' '_')
         ## when added the touch command here, if the user ended the program the file will be empty
         
         
         count=0
         index=1
         txt=""
         txtType=""
         colType=0
         read -p "Enter the number of columns: " col
         if [[ $col = "" ]]; then
         echo You didnt enter any value
         return
         fi
         while [ $count -lt $col ]; do
               read -p "Enter the name of column number $index: " colName
               if [[ $colName == *['!''?'@\#\$%^\&*()-+\.\/';']* || $colName == [0-9]* ]]; then
                    echo Invalid Input
                    return
               elif [[ [a-zA-Z_]* ]]; then
         	    colName=$(echo "$colName" | tr ' ' '_')
               fi
               if [ $colName ]; then
   
                   read -p "Enter the Type of column 'int' or 'string': " colType
                   if [ $colType = "" ]; then
                       echo No value entered
                       break
                  elif [[ $colType = "string" || $colType = "int" ]]; then
                  	if [[ $count == 0 ]]; then
                       
                          echo Table is in progress successfully
                           txt=$colName":"
                           txtType=$colType":"
                       else
                           txt=$txt$colName":"
                           txtType=$txtType$colType":"
                       fi  
                    else
                    	echo Unknown Data Type
                    	break   
                  fi
               else
                    echo No data entered
                    break
               fi
               
               ((count++))
               ((index++))
        done
        if [[ count -lt col ]]; then
         	return
         fi
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

else
    echo Table Already Exists
fi
