if [ -z "$1" ]
	then
	# use the default folder
	cosmosFolder=~/cosmos
else
	cosmosFolder=$1
fi

developer=$2
bitbucketUserName=$3

echo "------------------"
echo "Downloading COSMOS Repositories >>>> "

# clone the source code locally (can be later deployed into a remote/docker/etc.)
if [ -d $cosmosFolder/src/core ]
then
    echo "COSMOS/src/core exists"
else
    echo "------------------"

    # if ssh keys are set
    if [[ "$bitbucketUserName" = "" ]]; then
		echo "Cloning COSMOS/core from git@bitbucket.org:cosmos/core.git"

        if [[ "$developer" = "yes" ]]; then
	    	git clone git@bitbucket.org:cosmos/core.git src/core
		else
			echo "Cloning with depth 1 and branch master only"
			git clone --depth 1 --branch master git@bitbucket.org:cosmos/core.git src/core #$cosmos_source_folder/core
		fi
    else
		echo "Cloning COSMOS/core from https://$bitbucketUserName@bitbucket.org/cosmos/core.git"

        if [[ "$developer" = "yes" ]]; then
	        git clone https://$bitbucketUserName@bitbucket.org/cosmos/core.git src/core #$cosmos_source_folder/core
		else
			echo "Cloning with depth 1 and branch master only"
			git clone --depth 1 --branch master https://$bitbucketUserName@bitbucket.org/cosmos/core.git src/core #$cosmos_source_folder/core
		fi
    fi
fi

# clone the nodes folder locally (can be later deployed into a remote/docker/etc.)
if [ -d $cosmosFolder/nodes ]
then
    echo "COSMOS/nodes exists"
else
    echo "------------------"

	# if ssh keys are set
    if [[ "$bitbucketUserName" = "" ]]; then
    	echo "Cloning COSMOS/nodes from git@bitbucket.org:cosmos/nodes-cubesat1.git"
		
        if [[ "$developer" = "yes" ]]; then
	    	git clone git@bitbucket.org:cosmos/nodes-cubesat1.git nodes/cubesat1
		else
			echo "Cloning with depth 1 and branch master only"
			git clone --depth 1 --branch master git@bitbucket.org:cosmos/nodes-cubesat1.git nodes/cubesat1
		fi    	
    else
    	echo "Cloning COSMOS/nodes from https://$bitbucketUserName@bitbucket.org/cosmos/nodes.git"
		
		if [[ "$developer" = "yes" ]]; then
			git clone https://$bitbucketUserName@bitbucket.org/cosmos/nodes-cubesat1.git nodes/cubesat1
		else
			echo "Cloning with depth 1 and branch master only"
			git clone --depth 1 --branch master https://$bitbucketUserName@bitbucket.org/cosmos/nodes-cubesat1.git nodes/cubesat1
		fi	
	fi
fi

# clone the resources folder locally (can be later deployed into a remote/docker/etc.)
if [ -d $cosmosFolder/resources ]
then
    echo "COSMOS/resources exists"
else
    echo "------------------"

	# if ssh keys are set
    if [[ "$bitbucketUserName" = "" ]]; then
		echo "Cloning COSMOS/resources from git@bitbucket.org:cosmos/resources.git"

        if [[ "$developer" = "yes" ]]; then
	    	git clone git@bitbucket.org:cosmos/resources.git resources
		else
			echo "Cloning with depth 1 and branch master only"
			git clone --depth 1 --branch master git@bitbucket.org:cosmos/resources.git resources
		fi       	
    else
		echo "Cloning COSMOS/resources from https://$bitbucketUserName@bitbucket.org/cosmos/resources.git"

		if [[ "$developer" = "yes" ]]; then
			git clone https://$bitbucketUserName@bitbucket.org/cosmos/resources.git resources
		else
			echo "Cloning with depth 1 and branch master only"
			git clone --depth 1 --branch master https://$bitbucketUserName@bitbucket.org/cosmos/resources.git resources
		fi	
	fi
fi