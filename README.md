# Quick installer for COSMOS. #

This installer script will clone and build the COSMOS core libraries. We also provide a Docker file that runs the COSMOS-core and COSMOS-web applications.

* To get started follow the installation instructions to the [COSMOS Manual / Quick Install](https://docs.google.com/document/d/1xrLsOIelfm3DJb8nfm8n24lLsPU7E3KQZiw9NcfKKgg) google doc
* To get started with docker run the following commands

```
cd cosmos
sudo docker build -t cosmos .
```

Once the build has been completed, run the container:

```
sudo docker run --network host -it cosmos
```
