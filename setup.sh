#!/bin/bash

host=$(whoami)
if [[ $host != "root" ]]; then
	echo "Please switch user to root!"
	exit
fi
dir=/setups
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
cd /setup
where=$(pwd)
if [[ $where != "/setup" ]]; then 
	echo "Error!"
fi
echo "Checking ......"
if [[ -f "./setup.sh" ]]; then
	echo "Checking *....."
else
	echo "Unknow error!"
	exit
fi
if [[ -f "./login.sh" ]]; then
        echo "Checking **...."
else
        echo "Unknow error!"
        exit
fi
if [[ -f "./logout.sh" ]]; then
        echo "Checking ***..."
else
        echo "Unknow error!"
        exit
fi
if [[ -f "./addIN.txt" ]]; then
        echo "Checking ****.."
else
        echo "Unknow error!"
        exit
fi
if [[ -f "./addOUT.txt" ]]; then
        echo "Checking *****."
else
        echo "Unknow error!"
        exit
fi
if [[ -f "./welmsg.sh" ]]; then
        echo "Checking ******"
else
        echo "Unknow error!"
        exit
fi
cat commandinstall.txt >> /root/.profile
echo "installation successed!"
echo "You can use \"\$welmsg\" to use this project."
