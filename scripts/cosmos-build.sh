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

dockerBuild=$2

#echo "COSMOS folder set to: $cosmosFolder"

cd $cosmosFolder/tmp
cmake $cosmosFolder/src/core &>cmake.log
make -j12 install &>install.log

echo "COSMOS Build done!"
