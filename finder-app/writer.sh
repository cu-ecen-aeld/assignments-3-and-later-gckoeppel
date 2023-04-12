#!/bin/bash

# Accepts the following arguments: $
#  the first argument is a full path to a file (including filename) on the filesystem, referred to below as writefile; 
#  the second argument is a text string which will be written within this file, referred to below as writestr

# usage: writer.sh writefile writestr

# Exits with value 1 error and print statements if any of the arguments above were not specified
if [ $# != '2' ]; then
        echo "Wrong number of arguments, expected 2. writer.sh writefile writestr"
        exit 1
fi

writefile=$1
writedir=$(dirname $writefile)
writestr=$2

# Creates a new file with name and path writefile with content writestr, overwriting any existing file and creating the path if it doesn’t exist. 
# create path if it doesn't exist
if [ ! -d $writedir ]; then
	mkdir -p $writedir
	if [ $? != 0 ]; then
		echo "Unable to create directory '$dirname'"
		exit 1
	fi
fi

touch $writefile
if [ $? != 0 ]; then
	echo "Unable to touch file '$writefile'"
	exit 1
fi

echo $writestr > $writefile
echo "Wrote string '$writestr' to file '$writefile'"

exit 0

