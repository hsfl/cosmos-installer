# README #

Installer script for COSMOS


**Step 1** : clone the installer scripts
```
#!shell

git clone https://cosmos@bitbucket.org/cosmos/installer-linux.git cosmos
```

**Step 2** : configure cosmos-setup.sh file

change any of the configuration parameters listed in the cosmos-setup.sh file. You must at least change the 'bitbucketUserName'.

```
#!shell

cosmosFolder=~/cosmos
cosmosBuild='yes'
dockerBuild='no'
dockerRun='no'
downloadRepositories='yes'
bitbucketUserName='put-your-user-name-here'
```
**Step 3** : run cosmos-setup.sh

now run the setup file

```
#!shell
./cosmos-setup.sh
```
you will be prompted to enter your bitbucket password three times (for each repository: core, nodes, resources)

if you set the 'dockerBuild' or 'dockerRun' to 'yes' you will also be asked to put your linux user password (sudo is executed)

**Step 4** : verify installation

check that the bin folder was created inside the 'cosmos' folder

```
#!shell

$ ls
**bin**              Dockerfile  lib    README.md  scripts  tmp
cosmos-setup.sh  include     nodes  resources  src

```
check if the $PATH is set to the cosmos/bin folder


```
#!shell

echo $PATH
**/home/<your-user>/cosmos/bin**:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

```

execute the agent command

```
#!shell

$ agent
Usage: agent [ list | dump [soh, beat, ###] | node_name agent_name "request [ arguments ]" ]

```




