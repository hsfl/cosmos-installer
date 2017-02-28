# README #

Installer script for COSMOS. 

Mac prerequisites: Command Line Tools (or Xcode), git, cmake

Linux prerequisites: git, cmake


**Step 1** : clone the installer script

open the terminal and make sure you are in your home folder* (see bottom note) by entering the command
```
#!shell
cd
```
by default cosmos installs in the home folder of the current user. Clone the installer repository into the 'cosmos' folder. Enter the command
```
#!shell
git clone https://bitbucket.org/cosmos/installer-linux-mac.git cosmos
```

**Step 2** : run cosmos-setup.sh
For regular users just run the script with no changes. For advances users and developers please check the options section.
```
#!shell
./cosmos-setup.sh
```
This step will take a few minutes depending on your computer so just be patient.

**Step 3** : verify installation

check that the bin folder was created inside the 'cosmos' folder by entering the 'ls' command

```
#!shell
ls
```
the output will look like
```
#!shell
bin              Dockerfile  lib    README.md  scripts  tmp
cosmos-setup.sh  include     nodes  resources  src

```

If the bin folder is not listed check the tmp/cmake.log file to find the reason (possibly there was a problem running cmake). See the troubleshooting section.


finally, execute the cosmos agent command

```
#!shell
agent
```

if you see this line out of the agent command then you're set
```
#!shell
Usage: agent [ list | dump [soh, beat, ###] | node_name agent_name "request [ arguments ]" ]
```
COSMOS/core has been installed in your linux/macOS box.



# Options #

**Optional Step 2** : configure cosmos-setup.sh file

Go into the 'cosmos' folder
```
#!shell
cd cosmos
```
open the cosmos-setup.sh file with your favourite editor (vi, nano, Sublime Text, etc.) and change any of the configuration parameters at the head of the file. You must have the ssh keys configured between your PC and bitbucket account. These are the recommended installer script settings:
```
#!shell

developer='yes' 
verbose='yes'
cosmosFolder=~/cosmos
cosmosBuild='yes'
downloadRepositories='yes'
dockerBuild='no'
dockerRun='no'
```

Make sure to save the file. If you set the 'dockerBuild' or 'dockerRun' to 'yes' you must have 'docker' installed and you will also be asked to put your linux user password (sudo is executed). On the macOS if you don't have cmake installed it will install Homebrew, which will ask you to enter your computer user password.

# Troubleshooting #

**bin folder is missing**
check the tmp/cmake.log file to find the reason (possibly there was a problem running cmake). 

```
#!shell
cat tmp/cmake.log
```

check if the $PATH is set to the cosmos/bin folder (if not you may need to open a new terminal window for the $PATH to update, or $ source ~/.bash_profile)

```
#!shell
echo $PATH
```

output will look like
```
#!shell
/home/<your-user>/cosmos/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
```

*home folder on:

* mac: /Users/your_user/cosmos
* linux: /home/your_user/cosmos
* windows: C:/cosmos