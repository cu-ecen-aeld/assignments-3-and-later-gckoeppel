#!/bin/sh

# check if number of arguments is 2
if [ $# != '2' ]; then
	echo "Wrong number of arguments, expected 2. finder.sh filesdir searchstr"
	exit 1
fi

filesdir="$1"
searchstr="$2"

# check if filesdir exists
if [ ! -d $filesdir ]; then
	echo "No directory '$filesdir' found on the system"
	exit 1
fi

# count files in directory, count lines with searchstr
nr_of_files_in_dir=$(find $filesdir -type f | wc -l)
lines_found=$(grep -r $searchstr $filesdir | wc -l)

# print report
echo "The number of files are $nr_of_files_in_dir and the number of matching lines are $lines_found"

exit 0

