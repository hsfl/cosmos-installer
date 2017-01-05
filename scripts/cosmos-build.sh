#!/bin/bash

echo "------------------"
echo "COSMOS Build >>>> "

if [ -z "$1" ]
	then
	# use the default folder
	cosmosFolder=~/cosmos
else
	cosmosFolder=$1
fi

#dockerBuild=$2
verbose=$2

#echo "COSMOS folder set to: $cosmosFolder"

cd $cosmosFolder/tmp

# check if cmake exists
if hash cmake &> /dev/null ; then
    echo "cmake exists. going ahead with build. verbose $verbose"
else
	echo "cmake is required but not installed. Preparing to install cmake ... "
	# Mac Install
	if [[ "$OSTYPE" == "darwin"* ]]; then
		# echo "running macOS"
		# Install Homebrew
		if hash brew &> /dev/null; then
			:
		else
			echo "Installing Homebrew first"
	    	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"  
		fi
	
		echo "Installing Cmake"
		brew install cmake
	fi
fi

if [ "$verbose" = "no" ]; then
	cmake $cosmosFolder/src/core &>cmake.log
	make -j12 install &>install.log
else
	cmake $cosmosFolder/src/core >cmake.log
	make -j12 install >install.log
fi

echo "COSMOS Build done!"
