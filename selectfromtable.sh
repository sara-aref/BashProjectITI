#!/bin/bash

read -p "Enter name of table you want to select from: " name

if [ ! -f $name ]; then
	echo "Error! there is no table with that name."
else
	array=$(awk -F: '{if (NR==1) for(i=1;i<=NF;i++) {print $i}}' $name)

	select choice in all selection projection
	do
		case $choice in
			"all")
				sed -n '3,$p' $name
			;;
			"selection") #row
				select cols in $array
				do
					col=false
					for field in $array
                			do
                   				if [ "$cols" == "$field" ]; then
                   					col=true
                       		 			read -p "Enter value: " value
							grep -w $value $name
                        				break
                    				fi
                    				((col_num++))
                			done
					if [ "$col" == false ]; then
						echo "Error! choose number from the menu."
					fi
				done
			;;
			"projection") #col
				select cols in $array
				do
                			col_num=1
                			for field in $array #loop on 
                			do
                   				if [ "$cols" == "$field" ]; then #check if the 
                       		 			cut -d: -f $col_num $name
                        			break
                    				fi
                    				((col_num++))
                			done
				done
			;;
		esac
	done
fi
