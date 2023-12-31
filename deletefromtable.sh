#!/bin/bash

read -p "Enter name of table you want to delete from: " name

if [ ! -f $name ]; then
	echo "Error! there is no table with that name."
elif [[ $name = "" ]]; then
	echo "Enter the name of the table you want to delete."
else

	array=$(awk -F: '{if (NR==1) for(i=1;i<=NF;i++) {print $i}}' $name)
	no_array=$(awk -F: '{if (NR==1) {print NF}}' $name)

	select choice in all selection projection
	do
		case $choice in
			"all")
				sed -i '3,$d' $name
				echo "Data is deleted."
			;;
			"selection") #row
				select cols in $array
				do
					field=$REPLY
	
					if [[ "$field" -gt "$no_array" || "$field" < 1 ]]; then
						echo "please choose from the menu"
					else

                       			 	read -p "Enter value: " value
						data=$(awk -F: -v field="$field" -v value="$value" '{ if ($field == value ) {print $0} }' "$name")
						
						if [ -z "$data" ]; then
               						echo "No data found with the specified value."
               						break
            					else
                					awk -F: -v field="$field" -v value="$value" '{ if ($field != value ) {print $0} }' "$name" > temp
							mv temp "$name"
							echo "Data is deleted."
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
					
						if [ "$field" == 1 ]; then
							echo "You can't delete the primary key"
						else

                   					cut -d: -f"$field" --complement "$name" > temp
                       			 		mv temp "$name"
                					echo "Column is deleted"
                   					break

                    				fi
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
