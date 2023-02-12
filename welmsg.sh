#!/bin/bash
echo "Which user do you want to set up?(user.name/__QUIT__)"
read user
dir=/home/$user
cd /setup
if [[ -d "$dir" ]]; then
	cat addIN.txt >> /home/$user/.profile
	cat addOUT.txt >> /home/$user/.bash_logout
elif [[ $user == __QUIT__ ]]; then
	exit
else
	echo "There is no $user!"
	exit
fi
echo "Success!"
