# Installer script for COSMOS. #

If you want to integrate COSMOS into your software or contribute to the software you are considered a 'developer' ... then read the [README-developer.md](https://bitbucket.org/cosmos/installer-linux-mac/src/master/README-developer.md).
If you just want to install COSMOS and you are not necessarily thinking of changing the software then you're considered a 'regular user', follow along.

This installer script will help you to download and setup and install the essential elements of COSMOS: core, nodes, resources. This setup script only works on Linux and Mac. For Windows please follow the instructions from https://bitbucket.org/cosmos/tutorial/wiki/Setup

Before starting make sure you have the required tools installed:

* Linux prerequisites: git, cmake
* Mac prerequisites: Command Line Tools (or Xcode), git, cmake


# 1. clone the installer script #

By default cosmos installs in the home folder of the current user. Open the terminal and make sure you are in your home folder* (see bottom note) by entering the command
```
#!shell
cd
```
Clone the installer repository into the 'cosmos' folder. Enter the command
```
#!shell
git clone https://bitbucket.org/cosmos/installer-linux-mac.git cosmos
```
note that this command will create a 'cosmos' folder in your home directory and will copy the installer scripts.

# 2. Run cosmos-setup.sh #
For regular users just run the script with no changes. For advances users and developers please check the [options section](#markdown-header-options).
```
#!shell
cd cosmos
./cosmos-setup.sh
```
This step will take a few minutes depending on your computer (typically 2 min.).

# 3. Verify installation

check that the bin folder was created inside the 'cosmos' folder by entering the 'ls' command

```
#!shell
ls
```
you should be able to see a list of files and folders 
```
#!shell
bin              Dockerfile  lib    README.md  scripts  tmp
cosmos-setup.sh  include     nodes  resources  src

```

If the bin folder is not listed check the tmp/cmake.log file to find the reason (possibly there was a problem running cmake). See the [troubleshooting section](#markdown-header-troubleshooting).

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


# 4. Using COSMOS #

For developers we recommend installing Qt Creator and follow the relevant instructions on 

* COSMOS general setup instructions: https://bitbucket.org/cosmos/tutorial/wiki/Setup
* COSMOS/core setup instructions: https://bitbucket.org/cosmos/core
* API: http://cosmos-project.org/docs/core/current/

for users we recommend reading the API and tutorials 

* http://cosmos-project.org/docs/core/current/

The documentation is work in progress so if you have questions please contact us at cosmos@hsfl.hawaii.edu

-----------------------

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