#!/bin/bash

host=$(whoami)
if [[ $host != "root" ]]; then
	echo "Please switch user to root!"
	exit
fi
dir=/setup
if [[ -d "$dir" ]]; then
	call=/setup/welmsg.sh
	if [[ -f "$call" ]]; then
		echo "You have been install!"
		/setup/welmsg.sh
		exit
	else
		echo "Other project used the same name, installation failed!"
		exit
	fi
fi
mkdir /setup
host=$(pwd)
echo "Moving files..."
mv $host/setup.sh /setup
mv $host/login.sh /setup
mv $host/logout.sh /setup
mv $host/addIN.txt /setup
mv $host/addOUT.txt /setup
mv $host/welmsg.sh /setup
chmod +x /setup/welmsg.sh
echo "Moving files successed!"
echo "installation successed!"
