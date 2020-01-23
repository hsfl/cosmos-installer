# Quick installer for COSMOS. #

This installer script will clone and build the COSMOS core libraries. We also provide a Docker file that runs the COSMOS-core and COSMOS-web applications.

* To get started follow the installation instructions to the [COSMOS Manual / Quick Install](https://docs.google.com/document/d/1xrLsOIelfm3DJb8nfm8n24lLsPU7E3KQZiw9NcfKKgg) google doc
* To get started with docker run the following commands

To build the docker go into the cosmos folder and run (this step may take several minutes to complete):

```bash
$ cd ~/cosmos
$ sudo docker build -t cosmos .
```

Alternatively, you can pull the pre-built image from Docker hub if you don’t want to wait for the build process. Note the images is a 3.5 gigabytes.

```bash
$ sudo docker pull spencerpjy/cosmos
```

Once the build has been completed, run the container with various processes:

```
$ sudo docker run --network host --entrypoint agent_cpu cosmos
$ sudo docker run --network host --entrypoint cosmos_web cosmos
$ sudo docker run --network host --entrypoint agent_mongo cosmos
```
