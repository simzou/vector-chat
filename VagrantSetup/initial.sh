#! /bin/bash

sudo apt-get update
sudo apt-get install curl
curl -fsSL https://get.docker.com/ | sh
sudo usermod -aG docker vagrant

#install docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.9.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

#install docker machine
curl -L https://github.com/docker/machine/releases/download/v0.10.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine && 
chmod +x /tmp/docker-machine &&
sudo cp /tmp/docker-machine /usr/local/bin/docker-machine

# java
sudo apt-get install default-jre default-jdk -y

# protobuf libs
sudo apt-get install autoconf automake libtool curl make g++ unzip git wget python pkg-config gdb -y

# ndn-cxx
sudo apt-get install build-essential libsqlite3-dev libboost-all-dev libssl-dev -y

# initialize our submodules and retrieve their contents
cd /home/vagrant/vectorchat

sudo git submodule init
sudo git submodule update

# protobuf
cd protobuf
sudo sh -c './autogen.sh && ./configure && make && make install && ldconfig'

# ndn-cxx
cd /home/vagrant/vectorchat/ndn-cxx

# I was running out of memory to compile various libraries, adding swap space fixed this issue 
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

sudo sh -c "./waf configure && ./waf && ./waf install"

cd ../NFD
sudo sh -c "./waf configure && ./waf && ./waf install"



# vectorsync
cd /home/vagrant/vectorchat/VectorSync

sudo sh -c "./waf configure && ./waf && ./waf install"


