shopt -s extglob #turn on pattern and enable it

echo -e "\033[1;33mEnter the Table name: .. It shouldn't start with number and must not include any special character or space: \033[0m" && read -p "" nameTable

if [[ $nameTable = "" ]]; then
   echo -e "\033[1;31mYou didn't enter any value\033[0m"
elif [ ! -f "$nameTable" ]; then

    case $nameTable in
         *['!''?'@\#\$%^\&*()-+\.\/';']*)
         echo -e "\033[1;31mIncorrect Table name\033[0m"
         ;;
         
         [a-zA-Z_]*)
         nameTable=$(echo "$nameTable" | tr ' ' '_')
         ## when added the touch command here, if the user ended the program the file will be empty
         
         
         count=0
         index=1
         txt=""
         txtType=""
         colType=0
         echo -e "\033[1;33mEnter the number of columns: \033[0m" && read -p "" col
         if [[ $col = "" ]]; then
         echo -e "\033[1;31mYou didn't enter any value\033[0m"
         return
         fi
         while [ $count -lt $col ]; do
               index=1
	 echo -e "\033[1;33mEnter the name of column number $index: \033[0m" && read -p "" colName
               if [[ $colName == *['!''?'@\#\$%^\&*()-+\.\/';']* || $colName == [0-9]* ]]; then
                    echo -e "\033[1;31mInvalid Input\033[0m"
                    return
               elif [[ [a-zA-Z_]* ]]; then
         	    colName=$(echo "$colName" | tr ' ' '_')
               fi
               if [ $colName ]; then
   
                   echo -e "\033[1;33mEnter the Type of column 'int' or 'string': \033[0m" && read -p "" colType
                   if [ $colType = "" ]; then
                       echo -e "\033[1;31mNo value entered\033[0m"
                       break
                  elif [[ $colType = "string" || $colType = "int" ]]; then
                  	if [[ $count == 0 ]]; then
                       
                          echo -e "\033[1;32mTable is in progress successfully\033[0m"
                           txt=$colName":"
                           txtType=$colType":"
                       else
                           txt=$txt$colName":"
                           txtType=$txtType$colType":"
                       fi  
                    else
                    	echo -e "\033[1;31mUnknown Data Type\033[0m"
                    	break   
                  fi
               else
                    echo -e "\033[1;31mNo data entered\033[0m"
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
         echo -e "\033[1;31mIncorrect Input remove the number at the beginning\033[0m"
         ;;
         
         *)
         echo -e "\033[1;31mIncorrect Table name\033[0m"
         ;;
         esac

else
    echo -e "\033[1;31mInvalid Input Table already exists\033[0m"
fi
