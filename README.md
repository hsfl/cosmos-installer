## This repository is being deprecated and moved to the new location: https://github.com/hsfl/cosmos

## Quick installer for COSMOS

This installer script will clone and build the COSMOS core libraries. We also provide a Docker file that runs the COSMOS core and COSMOS Web applications.

* To get started follow the installation instructions to the [COSMOS Manual / Quick Install](https://docs.google.com/document/d/1xrLsOIelfm3DJb8nfm8n24lLsPU7E3KQZiw9NcfKKgg) google doc
* To get started with docker run the following commands

To build the docker go into the cosmos folder and run the build command (this step may take several minutes to complete):

```bash
$ cd ~/cosmos
$ docker build -t cosmos .
```

Alternatively, you can pull the pre-built image from Docker hub if you don’t want to wait for the build process. Note the images is a 3.5 gigabytes.

```bash
$ sudo docker pull spencerpjy/cosmos
```

Once the build has been completed or you have pulled the Docker container, run the container with various processes:

```
$ sudo docker run --network host --entrypoint agent_cpu cosmos
$ sudo docker run --network host --entrypoint cosmos_web cosmos
$ sudo docker run --network host --entrypoint agent_mongo cosmos
```


Resources to getting started with docker and C/C++ development
- https://devblogs.microsoft.com/cppblog/c-development-with-docker-containers-in-visual-studio-code/
