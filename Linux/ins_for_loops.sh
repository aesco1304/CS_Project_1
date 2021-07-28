#!/bin/bash

#lists
months=(
	'january'
	'february'
	'march'
	'april'
	'may'
	'june'
	'july'
	'august'
	'september'
	'october'
	'november'
	'december'
)

days=('mon' 'tues' 'wed' 'thurs' 'fri' 'sat' 'sun')

# Print out Months

for month in ${months[@]};
do
	echo $month
done

for day in ${days[@]};
do
	if [ $day = 'sun' ] || [ $day = 'sat' ]
	then
		echo "It is $day. Take it easy."
	else
		echo "It is $day. Get to work!"
	fi
done

for num in {0..5};
do
	if [ $num = 1 ] || [ $num = 4 ]
	then
		echo $num
	fi
done
