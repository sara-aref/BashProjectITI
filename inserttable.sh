#! /bin/bash
shopt -s extglob
export LC_COLLATE=C

read -p "Enter table name: " name

colnum=$(awk -F: '{if (NR==1) print NF}' "$name")

for ((i = 1; i <= $colnum; i++))
do
	datatype=$(awk -F: '{if (NR==2) for(i=1;i<=NF;i++) {print $i}}' "$name")
	for data in $datatype
	do
		if [[ "$data" == "int" ]]; then
			read -p "Enter data of row $i: " datacon

			if [[ "$datacon" =~ ^[0-9]*$ ]]; then
				echo -n $datacon":" >> "$name"
			fi

		elif [[ "$data" == "string" ]]; then
			read -p "Enter data of row $i: " datacon

			if [[ "$datacon" =~ ^[a-zA-Z0-9]*$ ]]; then
				echo -n $datacon":" >> "$name"
			fi
		fi
	done
	echo -e >> "$name"
done



