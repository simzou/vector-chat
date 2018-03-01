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
sudo apt-get install autoconf automake libtool curl make g++ unzip git wget python pkg-config -y

# ndn-cxx
sudo apt-get install build-essential libcrypto++-dev libsqlite3-dev libboost-all-dev libssl-dev -y

# protobuf
wget https://github.com/google/protobuf/releases/download/v3.5.1/protobuf-cpp-3.5.1.zip && unzip protobuf-cpp-3.5.1.zip
cd protobuf-3.5.1 
sudo sh -c './configure && make && make install && ldconfig'

# vectorsync
# cd ../VectorSync

# ./waf configure 
# TODO: this is giving the following error:
# -----------------------------------------------
# Setting top to                           : /home/vagrant/vectorchat/VectorSync
# Setting out to                           : /home/vagrant/vectorchat/VectorSync/build
# Checking for 'g++' (C++ compiler)        : /usr/bin/g++
# Checking supported CXXFLAGS              : -std=c++11
# Checking supported CXXFLAGS              : -O2 -g -pedantic -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers
# Checking for program 'pkg-config'        : /usr/bin/pkg-config
# Checking for 'protobuf'                  : yes
# Checking for program 'protoc'            : /usr/local/bin/protoc
# Checking for 'libndn-cxx'                : not found
# The configuration failed
# (complete log in /home/vagrant/vectorchat/VectorSync/build/config.log)
# -----------------------------------------------


