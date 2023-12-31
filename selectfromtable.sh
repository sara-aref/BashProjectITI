#!/bin/bash

read -p "Enter name of table you want to select from: " name

if [ ! -f $name ]; then
	echo "Error! there is no table with that name."
elif [[ $name = "" ]]; then
	echo "Enter the name of the table you want to select."
else
	array=$(awk -F: '{if (NR==1) for(i=1;i<=NF;i++) {print $i}}' $name)
	no_array=$(awk -F: '{if (NR==1) {print NF}}' $name)
	

	select choice in all selection projection
	do
		case $choice in
			"all")
				sed -n '3,$p' $name
			;;
			"selection") # row
				select cols in $array
				do

					field=$REPLY
					
					if [[ "$field" -gt "$no_array" || "$field" < 1 ]]; then
						echo "please choose from the menu"
					else
						
						read -p "Enter value for $cols: " value
						
						meta_data=$(awk -F: '{if (NR==1) {print $0}}' $name)
						data=$(awk -F: -v field="$field" -v value="$value" '{ if ( NR>2 && $field == value ) {print $0} }' $name)
						
						if [ -z "$data" ]; then
               						echo "No data found with the specified value."
               						break
            					else
                					echo -e "Data found with the specified value:\n$meta_data\n$data"
                					break
            					fi
	
					fi
					
				done
				
			;;

			"projection") #col
				select cols in $array
				do
					field=$REPLY
					
					if [[ "$field" -gt "$no_array" || "$field" < 1 ]]; then
						echo "please choose from the menu"
					else
                			
                       		 		cut -d: -f $field $name
                        			break
 
                			fi
				done
			;;
			*)
				echo "please choose from the menu"
			;;
		esac
		break
	done
fi
