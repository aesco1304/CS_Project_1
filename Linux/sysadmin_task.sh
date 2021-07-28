#!/bin/bash

#Define Packages List
packages=(
	'nano'
	'wget'
	'net-tools'
)

# Loop through the list of packages and check to see if they are installed
for package in ${packages[@]};
do
	if [ $(which $package) ]
	then
		echo "$package is installed at $(which $package)."
	else
		echo "$package is not installed."
	fi
done

# Search each user's home directory for scripts and provide a formatted output
for user in $(ls /home);
do
	for item in $(find /home/$user -iname '*.sh');
	do
		echo -e "Found a script in $user's home folder! \n$item"
	done
done

# Loop through the scripts in my scripts folder and change the permissions to execute
for script in $(ls $HOME/my_scripts);
do
	if [ ! -x $HOME/my_scripts/$script ]
	then
		chmod +x $HOME/my_scripts/$script
	fi
done

# Loop through a list of files and create a hash of each file
for file in $(ls $HOME/Documents/custom_scripts/*);
do
	sha256sum $file
done
