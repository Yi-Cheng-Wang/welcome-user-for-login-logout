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
mkdir /root/welmsg_readme
host=$(pwd)
echo "Moving files..."
mv $host/setup.sh /setup
mv $host/login.sh /setup
mv $host/logout.sh /setup
mv $host/addIN.txt /setup
mv $host/addOUT.txt /setup
mv $host/welmsg.sh /setup
mv $host/commandinstall.txt /setup
mv $host/中文介紹.md /root/welmsg_readme
mv $host/Enlish_README.sh /root/welmsg_readme
chmod +x /setup/welmsg.sh
echo "Moving files successed!"
cd /setup
where=$(pwd)
if [[ $where != "/setup" ]]; then 
	echo "Unknow error!"
	echo "installation failed!"
	exit
fi
echo "Checking ........."
if [[ -f "./setup.sh" ]]; then
	echo "Checking *........"
else
	echo "Error: setup.sh lost!"
	echo "Not critical error, installation continue."
fi
if [[ -f "./login.sh" ]]; then
        echo "Checking **......."
else
        echo "Error: login.sh lost!"
	echo "installation failed!"
        exit
fi
if [[ -f "./logout.sh" ]]; then
        echo "Checking ***......"
else
        echo "Error: logout.sh lost!"
	echo "installation failed!"
        exit
fi
if [[ -f "./addIN.txt" ]]; then
        echo "Checking ****....."
else
        echo "Error: addIN.txt lost!"
	echo "installation failed!"
        exit
fi
if [[ -f "./addOUT.txt" ]]; then
        echo "Checking *****...."
else
        echo "Error: addOUT.txt lost!"
	echo "installation failed!"
        exit
fi
if [[ -f "./welmsg.sh" ]]; then
        echo "Checking ******..."
else
        echo "Error: welmsg.sh lost!"
	echo "installation failed!"
        exit
fi
if [[ -f "./commandinstall.txt" ]]; then
        echo "Checking *******.."
else
        echo "Error: commandinstall.txt lost!"
	echo "installation failed!"
        exit
fi
cd /root/welmsg_readme
where=$(pwd)
if [[ $where != "/root/welmsg_readme" ]]; then
	echo "Unknow error!"
	echo "installation failed!"
	exit
fi
if [[ -f "./中文介紹.md" ]]; then
        echo "Checking ********."
else
        echo "Error: 中文介紹.md lost!"
	echo "Not critical error, installation continue."
        
fi
if [[ -f "./Engilsh_README.md" ]]; then
        echo "Checking *********"
else
        echo "Error: Engilsh_README.md lost!"
        echo "Not critical error, installation continue."
fi
cat commandinstall.txt >> /root/.profile
echo "installation successed!"
echo "You can use \"\$welmsg\" to use this project."
