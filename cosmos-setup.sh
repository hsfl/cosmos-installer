#!/bin/bash

cosmosFolder=~/cosmos
cosmosBuild='yes'
dockerBuild='no'
dockerRun='no'
downloadRepositories='yes'
bitbucketUserName='put-your-user-name-here'

echo ""
echo "------------------"
echo "COSMOS folder is set to: $cosmosFolder"

if [[ "$downloadRepositories" = "yes" ]]; then
	./scripts/cosmos-repos.sh $cosmosFolder $bitbucketUserName
fi

# build and install COSMOS locally
if [[ "$cosmosBuild" = "yes" ]]; then
	./scripts/cosmos-deploy.sh $cosmosFolder
	./scripts/cosmos-build.sh $cosmosFolder false
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
