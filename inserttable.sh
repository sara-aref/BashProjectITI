#!/bin/bash
shopt -s extglob
export LC_COLLATE=C

read -p "Enter table name: " name

if [ ! -f $name ]; then
	echo "Error! there is no table with that name."
else

	# Read the first column values into an array
	first_column_data=($(awk -F: '{if (NR > 1) print $1}' "$name"))

	continue=true
	while [[ "$continue" == true ]]; do

		# Read the data types into an array
		datatype=($(awk -F: '{if (NR==2) for(i=1;i<=NF;i++) print $i}' "$name"))

		# Use a flag to track whether any non-integer data was encountered
		encountered_non_integer=false

		#loop on the no. of array 
		for ((i=0; i<${#datatype[@]}; i++)); do
			data=${datatype[i]}

			if [[ "$data" == "int" ]]; then
				if [ $i -eq 0 ]; then
					read -p "Enter data of row for the first column: " datacon

					# Check if the entered data for the first column is not empty
					if [[ -n "$datacon" && "$datacon" =~ ^[0-9]+$ ]]; then
						# Check if the entered data for the first column is unique
						if [[ ! " ${first_column_data[@]} " =~ " $datacon " ]]; then
							echo -n "$datacon:" >> "$name"
						else
							echo "Error! Data for the first column must be unique. Please try again."
							encountered_non_integer=true
							break
						fi
					else
						echo "Error! Data for the first column cannot be empty and should be an integer. Please try again."
						encountered_non_integer=true
						break
					fi
				else
					read -p "Enter data of row for column $((i+1)) (int): " datacon
			
					# Allow null input for other columns
					if [[ -z "$datacon" || "$datacon" =~ ^[0-9]+$ ]]; then
						echo -n "$datacon:" >> "$name"
					else
						echo "Error! Data for column $((i+1)) must be an integer. Please try again."
						encountered_non_integer=true
						break
					fi
				fi
			elif [[ "$data" == "string" ]]; then
				if [ $i -eq 0 ]; then
					read -p "Enter data of row for the first column: " datacon

					# Check if the entered data for the first column is not empty
					if [[ -n "$datacon" && "$datacon" =~ ^[a-zA-Z0-9]+$ ]]; then
						# Check if the entered data for the first column is unique
						if [[ ! " ${first_column_data[@]} " =~ " $datacon " ]]; then
							echo -n "$datacon:" >> "$name"
						else
							echo "Error! Data for the first column must be unique. Please try again."
							encountered_non_integer=true
						fi
					else
						echo "Error! Data for the first column cannot be empty and should be an alphanumeric string. Please try again."
						encountered_non_integer=true
						break
					fi
				else
					read -p "Enter data of row for column $((i+1)) (string): " datacon
			
					# Allow null input for other columns
					if [[ -z "$datacon" || "$datacon" =~ ^[a-zA-Z0-9]+$ ]]; then
						echo -n "$datacon:" >> "$name"
					else
						echo "Error! Data for column $((i+1)) must be an alphanumeric string. Please try again."
						encountered_non_integer=true
						break
					fi
				fi
			fi
		done

		# Check if any non-integer data was encountered before adding a new line
		if [[ "$encountered_non_integer" == false ]]; then
			echo -e >> "$name"
		fi

		continue=false
	done
fi
