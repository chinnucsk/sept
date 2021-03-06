#!/bin/sh
#
# Print the list of git repositories that have uncommited changes

DIR=`dirname $0`
PWD=`cd $DIR; pwd`
cd $PWD
for i in *; do
    if [ -d $i ]; then
	cd $i
	RESULT=`git status --porcelain 2> /dev/null | grep -v '^??'`
	if [ ! -z "$RESULT" ]; then
	    echo "\033[31mDIRTY\033[0m $i";
	fi
	cd ..
    fi
done
