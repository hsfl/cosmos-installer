if [ -z "$1" ]
	then
	# use the default folder
	cosmosFolder=~/cosmos
else
	cosmosFolder=$1
fi

bitbucketUserName=$2

echo "------------------"
echo "COSMOS Repositories >>>> "

# clone the source code locally (can be later deployed into a remote/docker/etc.)
if [ -d $cosmosFolder/src/core ]
then
    echo "COSMOS/src/core exists"
else
	echo "Cloning COSMOS/core from https://$bitbucketUserName@bitbucket.org/cosmos/core.git"
	git clone https://$bitbucketUserName@bitbucket.org/cosmos/core.git src/core #$cosmos_source_folder/core
fi

# clone the nodes folder locally (can be later deployed into a remote/docker/etc.)
if [ -d $cosmosFolder/nodes ]
then
    echo "COSMOS/nodes exists"
else
	echo "Cloning COSMOS/nodes from https://$bitbucketUserName@bitbucket.org/cosmos/nodes.git"
	git clone https://$bitbucketUserName@bitbucket.org/cosmos/nodes.git nodes
fi

# clone the resources folder locally (can be later deployed into a remote/docker/etc.)
if [ -d $cosmosFolder/resources ]
then
    echo "COSMOS/resources exists"
else
	echo "Cloning COSMOS/resources from https://$bitbucketUserName@bitbucket.org/cosmos/resources.git"
	git clone https://$bitbucketUserName@bitbucket.org/cosmos/resources.git resources
fi