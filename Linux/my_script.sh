#!/bin/bash

name='Alejandro'
echo "Hello $name"
echo -e "\nThis is my script.\n"
echo -e "The files in $PWD are: \n$(ls)"
echo -e "\nCopying the passwd file to your directory.\n"
cp /etc/passwd $PWD
echo -e "The files in $PWD are now: \n$(ls)"
echo " "
echo "Have a great day"
