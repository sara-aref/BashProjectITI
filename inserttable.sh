#! /bin/bash
shopt -s extglob
export LC_COLLATE=C

read -p "Enter table name: " name

colnum=$(awk -F: '{if (NR==1) print NF}' "$name")

continue=true
while [[ "$continue" == true ]]
do
	fcoltype=$(awk -F: '{if (NR==2) {print $1}}' "$name")
	if [[ "$fcoltype" == "int" ]]; then
		read -p "Enter data of row: " datacon

		if [[ "$datacon" =~ ^[0-9]+$ ]]; then
			echo -n $datacon":" >> "$name"
		fi

	elif [[ "$fcoltype" == "string" ]]; then
		read -p "Enter data of row: " datacon

		if [[ "$datacon" =~ ^[a-zA-Z0-9]+$ ]]; then
			echo -n $datacon":" >> "$name"
		fi
	fi
	
	datatype=$(awk -F: '{if (NR==2) for(i=2;i<=NF;i++) {print $i}}' "$name")
	for data in $datatype
	do
		if [[ "$data" == "int" ]]; then
			read -p "Enter data of row: " datacon

			if [[ "$datacon" =~ ^[0-9]*$ ]]; then
				echo -n $datacon":" >> "$name"
			fi

		elif [[ "$data" == "string" ]]; then
			read -p "Enter data of row: " datacon

			if [[ "$datacon" =~ ^[a-zA-Z0-9]*$ ]]; then
				echo -n $datacon":" >> "$name"
			fi
		fi
	done
	echo -e >> "$name"
	continue=false
done



