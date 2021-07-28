#!/bin/bash

if [ $1 == 'Blackjack' ]; then
	grep "$2 $3" $4_Dealer_schedule | awk -F" " '{print $1, $2, $3, $4}'
elif [ $1 == 'Roulette' ]; then
	grep "$2 $3" $4_Dealer_schedule | awk -F" " '{print $1, $2, $5, $6}'
elif [ $1 == 'TexasHoldEm' ]; then
	grep "$2 $3" $4_Dealer_schedule | awk -F" " '{print $1, $2, $7, $8}'
else
	echo 'Please enter Blackjack, Roulette, or TexasHoldEm'
fi

##Bonus Activity##
