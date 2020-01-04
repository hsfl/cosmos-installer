FROM ubuntu:18.04

# Install CMake
RUN apt-get update
RUN apt-get install curl build-essential wget libz-dev gcc-7 g++-7 cmake git openssl libssl-dev libsasl2-dev libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev snapd -y \
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get update
RUN apt-get install nodejs -y
RUN apt-get install git -y

# Run installer
RUN git clone https://bitbucket.org/cosmos-project/installer.git /root/cosmos
RUN chmod +x /root/cosmos/cosmos-install.sh

WORKDIR /root/cosmos/
RUN /root/cosmos/cosmos-install.sh

WORKDIR /

# Retrieve required repositories
RUN wget https://github.com/mongodb/mongo-c-driver/releases/download/1.13.1/mongo-c-driver-1.13.1.tar.gz \
  && tar xzf mongo-c-driver-1.13.1.tar.gz
RUN git clone https://github.com/mongodb/mongo-cxx-driver.git --branch releases/stable --depth 1

# Mongo C Installation
WORKDIR /mongo-c-driver-1.13.1/cmake-build
RUN cmake -DENABLE_AUTOMATIC_INIT_AND_CLEANUP=OFF .. \
  && make -j4 \
  && make install

# Mongo CXX Installation
WORKDIR /mongo-cxx-driver/build
RUN cmake -DCMAKE_BUILD_TYPE=Release -DBSONCXX_POLY_USE_BOOST=1 -DCMAKE_INSTALL_PREFIX=/usr/local .. \
  && make -j4 \
  && make install

# Agent Mongo Installation
WORKDIR /root/cosmos/source/projects
RUN git clone https://github.com/spjy/cosmos-mongodb.git
WORKDIR /root/cosmos/source/projects/cosmos-mongodb/agent_build
RUN cmake ../source \
  && make -j4

# COSMOS Web installation
#WORKDIR /root/cosmos/projects
#RUN git clone https://github.com/spjy/cosmos-web.git
#WORKDIR /root/cosmos-web
#RUN npm install

RUN chmod +x /root/cosmos/docker-init.sh

#CMD /root/cosmos/docker-init.sh
