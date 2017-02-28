if [ -z "$1" ]
	then
	# use the default folder
	cosmosFolder=~/cosmos
else
	cosmosFolder=$1
fi

developer=$2

echo "------------------"
echo "Downloading COSMOS Repositories >>>> "

# clone the source code locally (can be later deployed into a remote/docker/etc.)
if [ -d $cosmosFolder/src/core ]
then
    echo "COSMOS/src/core exists"
else
    echo "------------------"

    # use ssh
    if [[ "$developer" = "yes" ]]; then
		echo "Cloning COSMOS/core from git@bitbucket.org:cosmos/core.git"
	    git clone git@bitbucket.org:cosmos/core.git src/core
    else # use https
		echo "Cloning COSMOS/core from https://bitbucket.org/cosmos/core.git"
		echo "Cloning with depth 1 and branch master only"
		git clone --depth 1 --branch master https://bitbucket.org/cosmos/core.git src/core
    fi
fi

# clone the nodes folder locally (can be later deployed into a remote/docker/etc.)
if [ -d $cosmosFolder/nodes ]
then
    echo "COSMOS/nodes exists"
else
    echo "------------------"

    # use ssh
    if [[ "$developer" = "yes" ]]; then
		echo "Cloning COSMOS/nodes/cubesat1 from git@bitbucket.org:cosmos/nodes-cubesat1.git"
	    git clone git@bitbucket.org:cosmos/nodes-cubesat1.git nodes/cubesat1
    else # use https
		echo "Cloning COSMOS/nodes/cubesat1 from https://bitbucket.org/cosmos/nodes-cubesat1.git"
		echo "Cloning with depth 1 and branch master only"
		git clone --depth 1 --branch master https://bitbucket.org/cosmos/nodes-cubesat1.git nodes/cubesat1
    fi
fi

# clone the resources folder locally (can be later deployed into a remote/docker/etc.)
if [ -d $cosmosFolder/resources ]
then
    echo "COSMOS/resources exists"
else
    echo "------------------"

    # use ssh
    if [[ "$developer" = "yes" ]]; then
		echo "Cloning COSMOS/resources from git@bitbucket.org:cosmos/resources.git"
	    git clone git@bitbucket.org:cosmos/resources.git resources
    else # use https
		echo "Cloning COSMOS/resources from https://bitbucket.org/cosmos/resources.git"
		echo "Cloning with depth 1 and branch master only"
		git clone --depth 1 --branch master https://bitbucket.org/cosmos/resources.git resources
    fi
fi