# sudo docker build -t cosmos .
# sudo docker run -it cosmos

FROM ubuntu:14.04
MAINTAINER Miguel Nunes <miguel.nunes@hsfl.hawaii.edu>

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y build-essential cmake git gcc g++ gdb

# Make ssh dir
#RUN mkdir /root/.ssh/

# Copy over private key, and set permissions
#ADD id_rsa /root/.ssh/id_rsa

# Create known_hosts
#RUN touch /root/.ssh/known_hosts

# Add bitbuckets key
#RUN ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts

#RUN mkdir /root/cosmos
#RUN mkdir /root/cosmos/src 
#RUN mkdir /root/cosmos/src/core

#COPY src/core /root/cosmos/src/core
#COPY nodes /root/cosmos/nodes
#COPY resources /root/cosmos/resources

# The scripts are mandatory
COPY scripts /root/cosmos/scripts
RUN echo "export PATH=/root/cosmos/bin:$PATH" >>~/.bashrc

# run the build script
#RUN cd /root/cosmos
COPY cosmos-setup.sh /root/cosmos/
#RUN chmod +x /root/cosmos-build.sh
#RUN /root/cosmos-build.sh

#RUN git clone https://spacemig@bitbucket.org/spacemig/core.git
#RUN git clone git@bitbucket.org:cosmos/core.git
