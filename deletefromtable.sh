#!/bin/bash

echo -e "\033[1;33mEnter name of table you want to delete from: \033[0m" && read -p "" name

if [ ! -f $name ]; then
	echo -e "\033[1;31mError! there is no table with that name.\033[0m"
elif [[ $name = "" ]]; then
	echo -e "\033[1;31mEnter the name of the table you want to delete.\033[0m"
else

	array=$(awk -F: '{if (NR==1) for(i=1;i<=NF;i++) {print $i}}' $name)
	no_array=$(awk -F: '{if (NR==1) {print NF}}' $name)

	continue=true	
	while [[ "$continue" == true ]]; do
	
		select choice in "Delete all Data" "Delete specific row" "Delete specific column" "exit"
		do
			case $choice in
				"Delete all Data")
					sed -i '3,$d' $name
					echo -e "\033[1;32mData is deleted.\033[0m"
				;;
				"Delete specific row")
					echo -e "\033[1;33mChoose one of the fields\033[0m"
					select cols in $array
					do
						field=$REPLY
		
						if [[ "$field" -gt "$no_array" || "$field" < 1 ]]; then
							echo -e "\033[1;31mplease choose from the list\033[0m"
						else
	
	                       			 	echo -e "\033[1;33mEnter value: \033[0m" && read -p "" value
							data=$(awk -F: -v field="$field" -v value="$value" '{ if (NR>2 && $field == value ) {print $0} }' "$name")
						
							if [ -z "$data" ]; then
	               						echo -e "\033[1;31mNo data found with the specified value.\033[0m"
	               						break
	            					else
	                					awk -F: -v field="$field" -v value="$value" '{ if ($field != value ) {print $0} }' "$name" > temp
								mv temp "$name"
								echo -e "\033[1;32mData is deleted.\033[0m"
								break
							fi
	                			fi
					done
				;;
				"Delete specific column")
					echo -e "\033[1;33mChoose one of the columns\033[0m"
					select cols in $array
					do
						field=$REPLY
					
						if [[ "$field" -gt "$no_array" || "$field" < 1 ]]; then
							echo -e "\033[1;31mplease choose from the list\033[0m"
						else
					
							if [ "$field" == 1 ]; then
								echo -e "\033[1;31mYou can't delete the primary key\033[0m"
								break
							else
	
	                   					cut -d: -f"$field" --complement "$name"> temp
	                       			 		mv temp "$name"
	                					echo -e "\033[1;32mColumn is deleted\033[0m"
	                   					break
	
	                    				fi
	                    			fi
					done
				;;
				"exit")
					exit
				;;
				*)
					echo -e "\033[1;31mplease choose from the list\033[0m"
					break
				;;
			esac
			break
		done
	done
fi
