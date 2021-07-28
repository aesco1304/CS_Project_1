#!/bin/bash
grep "$1 $2" $3_Dealer_schedule | awk -F" " '{print $1, $2, $5, $6}'
