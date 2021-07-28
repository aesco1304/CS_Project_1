#!/bin/bash

# Variables
output=$HOME/research/sys_info.txt
ip=$(ip addr | grep inet | tail -2 | head -1)
execs=$(find /home -type f -perm 777 2> /dev/null)
files=(
        '/etc/shadow'
        '/etc/passwd'
)
commands=('date' 'uname -a' 'hostname-s')

#Script

if [ ! -d $HOME/research ]
then
	mkdir $HOME/research 2> /dev/null
fi

if [ -f $output ]
then
	rm $output
fi

echo "Hello. This a quick system audit script. Today is $(date +%F)" > $output
echo -e "\nThis is this machines information:" >> $output
uname -a >> $output
echo -e "\nThis machines IP Address is:" >> $output
hostname -I | awk '{print $1}' >> $output
echo -e "\nThe hostname is:" >> $output
hostname >> $output
echo "DNS Servers: " >> $output
cat /etc/resolv.conf >> $output

#Display memory info
echo "Memory Info: " >> $output
free >> $output

#Display CPU Info
echo -e "\nCPU Info:" >> $output
lscpu | grep CPU >> $output

#display disk info
echo -e "\nDisk Usage:" >> $output
df -H | head -2 >> $output

#Display Who is Info
echo -e "\nWho is logged in: \n $(who) \n" >> $output
sudo find /home -type f -perm 777 >> $output
echo -e "\nTop 10 Processes:" >> $output
ps aux --sort -%mem | awk '{print $1, $2, $3, $4, $11}' | head >> $output

#Permissions for shadow and passwd
echo -e "\nThe permissions for sensitive /etc files: \n" >> $output
for file in ${files[@]};
do
	ls -l $file >> $output
done

# Display check for Sudo Permission
for user in $(ls /home);
do
	sudo -lU $user >> $output
done

# Display List of Commands
for x in {0..2};
do
	results=$(${commands[$x]})
	echo "Results of \"${commands[$x]}\" command:" >> $output
	echo $results >> $output
	echo ""
done


##$MACHTYPE for machine type info##
