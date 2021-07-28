#!/bin/bash

# Variables
states=('California' 'Oregon' 'Washington' 'New York' 'Nevada')
nums=$(echo {0..9})
ls_out=$(ls)
execs=$(find /home -type f -perm 777 2> /dev/null)

# Variables for Activity 3
files=(
	'/etc/shadow'
	'/etc/passwd'
)



# Script

for state in ${states[@]};
do
	if [ state == 'Hawaii' ]
	then
		echo "Hawaii is the best!"
	else
		echo "I'm not that fond of Hawaii."
	fi
done

# Number Loop - Bonus

for num in ${nums[@]} ;
do
	if [ $num == '3' ] || [ $num == '7' ] || [ $num == '5' ]
	then
		echo $num
	fi
done

# ls Loop - Bonus
for x in ${ls_out[@]};
do
	echo $x
done

# Super Bonus - Exec Loop
for exc in ${execs[@]};
do
	echo $exc
done

# Activity 3 - Print permissions for each file in the list
for file in ${files[@]};
do
	ls -la $file
done

# Bonus 1 - For each user in the home directory, print sudo permission
