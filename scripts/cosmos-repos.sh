if [ -z "$1" ]
	then
	# use the default folder
	cosmosFolder=~/cosmos
else
	cosmosFolder=$1
fi

#developer=$2
usertype="$2"

echo "------------------"
echo "Downloading COSMOS Repositories >>>> "
echo "Setup as" $usertype

# clone the source code locally (can be later deployed into a remote/docker/etc.)
if [ -d $cosmosFolder/source/core ]
then
    echo "COSMOS/source/core exists"
else
    echo "------------------"

    # use ssh
    if [[ "$usertype" = "developer" ]]; then
    	# developer must have ssh keys enabled
		echo "Cloning COSMOS/core from git@bitbucket.org:cosmos/core.git"
	    git clone git@bitbucket.org:cosmos/core.git source/core
    else # not a developer use https, just download zip file
		#echo "Cloning COSMOS/core from https://bitbucket.org/cosmos/core.git"
		#echo "Cloning with depth 1 and branch master only"
		#git clone --depth 1 --branch master https://bitbucket.org/cosmos/core.git source/core

		echo "Downloading COSMOS/core from https://bitbucket.org/cosmos/core/get/master.zip"
		# download the latest master as a zip file

		if [[ "$OSTYPE" == "linux-gnu" ]]; then
			wget -O core.zip https://bitbucket.org/cosmos/core/get/master.zip
		elif [[ "$OSTYPE" == "darwin"* ]]; then
		     # Mac OSX
			curl https://bitbucket.org/cosmos/core/get/master.zip -o core.zip
		fi

		# unzip it (goes to a folder like cosmos-core-19271d3b9a1b)
		unzip -q -d source core.zip

		# rename the folder to core (cosmos-core-19271d3b9a1b -> core)
		mv source/cosmos-core* source/core
		
		# delete zip file
		rm core.zip

    fi
fi

# clone the nodes folder locally (can be later deployed into a remote/docker/etc.)
if [ -d $cosmosFolder/nodes ]
then
    echo "COSMOS/nodes exists"
else
    echo "------------------"

    # use ssh
    if [[ "$usertype" = "developer" ]]; then
		echo "Cloning COSMOS/nodes/cubesat1 from git@bitbucket.org:cosmos/nodes-cubesat1.git"
	    git clone git@bitbucket.org:cosmos/nodes-cubesat1.git nodes/cubesat1
    else # not a developer use https, just download zip file
		#echo "Cloning COSMOS/nodes/cubesat1 from https://bitbucket.org/cosmos/nodes-cubesat1.git"
		#echo "Cloning with depth 1 and branch master only"
		#git clone --depth 1 --branch master https://bitbucket.org/cosmos/nodes-cubesat1.git nodes/cubesat1

		echo "Downloading COSMOS/nodes/cubesat1 from https://bitbucket.org/cosmos/nodes-cubesat1/get/master.zip"
		# download the latest master as a zip file
		if [[ "$OSTYPE" == "linux-gnu" ]]; then
			wget -O cubesat1.zip https://bitbucket.org/cosmos/nodes-cubesat1/get/master.zip
		elif [[ "$OSTYPE" == "darwin"* ]]; then
		     # Mac OSX
			curl https://bitbucket.org/cosmos/nodes-cubesat1/get/master.zip -o cubesat1.zip
		fi

		# unzip it 
		unzip -q -d nodes cubesat1.zip

		# rename the folder to nodes/neutron1 
		mv nodes/cosmos-nodes-cubesat1* nodes/cubesat1

		# delete zip file
		rm cubesat1.zip

    fi
fi

# clone the resources folder locally (can be later deployed into a remote/docker/etc.)
if [ -d $cosmosFolder/resources ]
then
    echo "COSMOS/resources exists"
else
    echo "------------------"

    # use ssh
    if [[ "$usertype" = "developer" ]]; then
		echo "Cloning COSMOS/resources from git@bitbucket.org:cosmos/resources.git"
	    git clone git@bitbucket.org:cosmos/resources.git resources
    else # not a developer use https, just download zip file
		#echo "Cloning COSMOS/resources from https://bitbucket.org/cosmos/resources.git"
		#echo "Cloning with depth 1 and branch master only"
		#git clone --depth 1 --branch master https://bitbucket.org/cosmos/resources.git resources

		echo "Downloading COSMOS/resources from https://bitbucket.org/cosmos/resources/get/master.zip"
		# download the latest master as a zip file
		if [[ "$OSTYPE" == "linux-gnu" ]]; then
			wget -O resources.zip https://bitbucket.org/cosmos/resources/get/master.zip
		elif [[ "$OSTYPE" == "darwin"* ]]; then
		     # Mac OSX
			curl https://bitbucket.org/cosmos/resources/get/master.zip -o resources.zip
		fi

		# unzip it 
		unzip -q resources.zip

		# rename the folder to core 
		mv cosmos-resources* resources

		# delete zip file
		rm resources.zip
    fi
fi