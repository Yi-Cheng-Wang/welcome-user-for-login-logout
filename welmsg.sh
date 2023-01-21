#!/bin/bash
echo "Which user do you want to set up?(user.name/__ALL__/__NONE__/__QUIT__)"
read user
dir=/home/$user
if [[ -d "$dir" ]]; then
	echo "1"
	cat addIN.txt >> /home/$user/.profile
	cat addOUT.txt >> /home/$user/.bash_logout
elif [[ $user == __ALL__ ]]; then
	echo "2"
elif [[ $user == __NONE__ ]]; then
	echo "3"
elif [[ $user == __QUIT__ ]]; then
	exit
else
	echo "There is no $user!"
	exit
fi
echo "Success!"
