# README #

Installer script for COSMOS


**Step 1** : clone the installer scripts

open the terminal and make sure you are in your home folder* (see bottom note) by entering the command
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

check that the bin folder was created inside the 'cosmos' folder by entering the 'ls' command

```
#!shell
ls -l
```
the output will look like
```
#!shell
ls -l
-rw-r--r--   1 username  staff   1.0K Dec 14 23:30 Dockerfile
-rw-r--r--   1 username  staff   2.4K Dec 14 23:30 README.md
drwxr-xr-x  78 username  staff   2.6K Dec 15 00:15 bin/
-rwxr-xr-x   1 username  staff   1.1K Dec 14 23:34 cosmos-setup.sh*
drwxr-xr-x   9 username  staff   306B Dec 14 23:39 include/
drwxr-xr-x  15 username  staff   510B Dec 15 00:19 lib/
drwxr-xr-x  20 username  staff   680B Oct 13 09:20 nodes/
drwxr-xr-x  10 username  staff   340B Dec 14 23:40 resources/
drwxr-xr-x   5 username  staff   170B Dec 14 23:30 scripts/
drwxr-xr-x  17 username  staff   578B Dec 15 00:57 src/
drwxr-xr-x  12 username  staff   408B Dec 15 00:19 tmp/

```


If the bin folder is not listed check the tmp/cmake.log file to find the reason (possibly there was a problem running cmake)

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

*home folder on:

* mac: /Users/your_user/cosmos
* linux: /home/your_user/cosmos
* windows: C:/cosmos