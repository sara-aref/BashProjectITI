#!/bin/bash

echo -e "\033[1;33mEnter name of table you want to select from: \033[0m" && read -p "" name

if [ ! -f $name ]; then
	echo -e "\033[1;31mError! there is no table with that name.\033[0m"

elif [[ $name = "" ]]; then
	echo -e "\033[1;31mYou didn't enter any value\033[0m"
else
	array=$(awk -F: '{if (NR==1) for(i=1;i<=NF;i++) {print $i}}' $name)
	no_array=$(awk -F: '{if (NR==1) {print NF}}' $name)
	meta_data=$(awk -F: '{if (NR==1) {print $0}}' $name)
	
	continue=true	
	while [[ "$continue" == true ]]; do
		select choice in "Show all data" "Show specific row" "Show specific column" "exit"
		do
			case $choice in
				"Show all data")
					echo $meta_data
					sed -n '3,$p' $name
				;;
				"Show specific row")
					echo -e "\033[1;33mChoose one of the fields\033[0m"
					select cols in $array
					do

						field=$REPLY
					
						if [[ "$field" -gt "$no_array" || "$field" < 1 ]]; then
							echo -e "033[1;31mplease choose from the menu\033[0m"
						else
						
							echo -e "\033[1;33mEnter value for $cols: \033[0m" && read -p "" value
						
							data=$(awk -F: -v field="$field" -v value="$value" '{ if ( NR>2 && $field == value ) {print $0} }' $name)
						
							if [ -z "$data" ]; then
               							echo -e "033[1;31mNo data found with the specified value.\033[0m"
               							break
            						else
                						echo "Data found with the specified value:\n$meta_data\n$data"
                						break
            						fi
		
						fi
						
					done
				
				;;

				"Show specific column")
					echo "Choose one of the columns"
					select cols in $array
					do
						field=$REPLY
					
						if [[ "$field" -gt "$no_array" || "$field" < 1 ]]; then
							echo "please choose from the menu"
						else
                			
                	       		 		cut -d: -f $field $name | sed "2d"
                	        			break
 
                				fi
					done
				;;
			
				"exit")
					exit
				;;
				*)
					echo "please choose from the menu"
					break
				;;
			esac
			break
		done
	done
fi
