FROM ubuntu

RUN apt-get update

RUN apt-get install -y autoconf automake libtool curl make g++ unzip git wget python

RUN apt-get install -y pkg-config

RUN mkdir /vector-chat

COPY . /vector-chat

RUN wget https://github.com/google/protobuf/releases/download/v3.5.1/protoc-3.5.1-linux-x86_64.zip && \
    unzip protoc-3.5.1-linux-x86_64.zip 

RUN cd vector-chat/VectorSync && ./waf configure