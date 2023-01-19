#!/bin/bash

host=$(whoami)
if [[ $host != "root" ]]; then
	echo "Please switch user to root!"
	exit
fi
mkdir /setupex
host=$(pwd)
echo "Moving files..."
mv $host/setup.sh /setupex
echo "Which user do you want to set up?"
read user
cat addIN.txt >> /home/$user/.profile
cat addOUT.txt >> /home/$user/.bash_logout
