#!/bin/bash

cosmosFolder=~/cosmos
cosmosBuild='yes'
verbose='yes'
downloadRepositories='yes'
bitbucketUserName='' # if left empty it uses ssh, https otherwise
developer='no' # 'yes' will clone all the repository history (more space used), 'no' will just download the last commit form the master branch (faster download)
dockerBuild='no'
dockerRun='no'

echo ""
echo "------------------"
echo "COSMOS folder is set to: $cosmosFolder"

# essentials
# sudo apt-get update
# sudo apt-get install build-essential cmake git -y # -y tells apt-get not to prompt and just get on with installing


if [[ "$downloadRepositories" = "yes" ]]; then
	./scripts/cosmos-repos.sh $cosmosFolder $developer $bitbucketUserName 
fi

# build and install COSMOS locally
if [[ "$cosmosBuild" = "yes" ]]; then
	./scripts/cosmos-deploy.sh $cosmosFolder
	./scripts/cosmos-build.sh $cosmosFolder $verbose
fi

# build docker
if [[ "$dockerBuild" = "yes" ]]; then
	echo "------------------"
	echo "COSMOS Docker Build >>>> "
	sudo docker build -t cosmos .
fi

# run docker
if [[ "$dockerRun" = "yes" ]]; then
	echo "------------------"
	echo "COSMOS Docker Deploy >>>> "
	#sudo docker run -it cosmos /bin/bash -c 'cd /root/cosmos; '
	#sudo docker run -it -v $cosmos_source_folder:/root/cosmos-source cosmos
	sudo docker run -it cosmos
fi
