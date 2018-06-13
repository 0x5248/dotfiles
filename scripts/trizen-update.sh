#!/usr/bin/env sh

# to run this command without typing in the sudo password
# add 'USERNAME HOSTNAME=NOPASSWD: /bin/pacman -Sy' at 
# the end of the file /etc/sudoers
trizen -Sy

UPDATE="$(trizen -Qu | wc -l)"
#echo ${UPDATE}

if [ ${UPDATE} -ge 1 ]
then
	trizen -Syu
else
	echo 'No updates available'
	exit 0
fi
