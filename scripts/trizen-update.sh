#!/usr/bin/env sh

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
