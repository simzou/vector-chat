FROM ubuntu

RUN apt-get update
RUN apt-get install -y autoconf automake libtool curl make g++ unzip git wget python pkg-config
RUN mkdir /vector-chat
COPY . /vector-chat

RUN wget https://github.com/google/protobuf/releases/download/v3.5.1/protobuf-cpp-3.5.1.zip && unzip protobuf-cpp-3.5.1.zip
RUN cd protobuf-3.5.1 && ./configure && make && make install && ldconfig

RUN cd ../vector-chat/VectorSync && ./waf configure