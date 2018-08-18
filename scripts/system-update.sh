#!/usr/bin/env sh

# to run this command without typing in the sudo password
# add 'USERNAME HOSTNAME=NOPASSWD: /usr/bin/pacman -Sy' at 
# the end of the file /etc/sudoers
sudo yay -Sy

UPDATE="$(yay -Qu | wc -l)"
#echo ${UPDATE}

if [ ${UPDATE} -ge 1 ]
then
	sudo yay -Syu
else
	echo 'No updates available'
	exit 0
fi
