# README #

Installer script for COSMOS


**Step 1** : clone the installer scripts

open the terminal and make sure you are in your home folder* by entering the command
```
#!shell
cd
```
by default cosmos installs in the home folder of the current user. Clone the installer repository into the 'cosmos' folder. Enter the command
```
#!shell
git clone https://cosmos@bitbucket.org/cosmos/installer-linux-mac.git cosmos
```

**Step 2** : configure cosmos-setup.sh file

Go into the 'cosmos' folder
```
#!shell
cd cosmos
```
open the cosmos-setup.sh file with your favorite editor (vi, nano, Sublime Text, etc.) and change any of the configuration parameters at the head of the file
```
#!shell

cosmosFolder=~/cosmos
cosmosBuild='yes'
dockerBuild='no'
dockerRun='no'
downloadRepositories='yes'
bitbucketUserName='put-your-user-name-here'
developer='no'
```

You must at least change the 'bitbucketUserName' to be able to download the COSMOS repositories that you have access to with your bitbucket account. For faster downloads use 'no' for 'developer', 'yes' will clone all the repository history (more space used), 'no' will just download the last commit form the master branch (faster download). If you haven't gotten access to the COSMOS repositories go to: http://cosmos-project.org/getting-started.php. Make sure to save the file.


**Step 3** : run cosmos-setup.sh

```
#!shell
./cosmos-setup.sh
```
you will be prompted to enter your bitbucket password (for each repository: core, nodes, resources). If you set the 'dockerBuild' or 'dockerRun' to 'yes' you must have 'docker' installed and you will also be asked to put your linux user password (sudo is executed). On the macOS if you don't have cmake installed it will install Homebrew, which will ask you to enter your computer user password.

**Step 4** : verify installation

check that the bin folder was created inside the 'cosmos' folder (if not check the tmp/cmake.log file).

```
#!shell
ls
**bin**              Dockerfile  lib    README.md  scripts  tmp
cosmos-setup.sh  include     nodes  resources  src

```
check if the $PATH is set to the cosmos/bin folder (if not you may need to open a new terminal window for the $PATH to update, or $ source ~/.bash_profile)

```
#!shell

echo $PATH
/home/<your-user>/cosmos/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

```

finally, execute the cosmos agent command

```
#!shell
agent
Usage: agent [ list | dump [soh, beat, ###] | node_name agent_name "request [ arguments ]" ]

```
if you see this line out of the agent command then you're set. COSMOS/core has been installed in your linux/macOS box.

*home folder on:
* mac: /Users/your_user/cosmos
* linux: /home/your_user/cosmos
* windows: C:/cosmos