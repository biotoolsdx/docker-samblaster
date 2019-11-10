FROM ubuntu:16.04

MAINTAINER Chen Yuelong <yuelong.chen.btr@gmail.com>

ARG sambamblaster_version=v.0.1.24


RUN apt-get update && \
    apt-get install -y wget zip gcc make g++ && \
    cd /tmp/ && \
    wget https://github.com/GregoryFaust/samblaster/archive/$sambamblaster_version.zip && \
    unzip $sambamblaster_version.zip && \
    cd samblaster-$sambamblaster_version && \
    make && cp samblaster /usr/local/bin

RUN apt-get clean && \
    apt-get remove -y wget make gcc zip g++ && \
    rm -rf /tmp/*


CMD bash