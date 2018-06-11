#!/usr/bin/env sh

trizen --refresh #it's the same like trizen -y

UPDATE="$(trizen -Qu | wc -l)"
#echo ${UPDATE}

if [ ${UPDATE} -ge 1 ]
then
	trizen -Syu
else
	echo 'No updates available'
	exit 0
fi
