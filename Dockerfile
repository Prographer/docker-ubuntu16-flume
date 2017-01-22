FROM ubuntu:16.04
MAINTAINER Prographer J<prographer.j@gmail.com>

USER root

ARG FLUME_VERSION=1.7.0

#install dev tools
RUN apt-get update
RUN apt-get install -y curl tar gzip sudo openssh-server openssh-client rsync  net-tools

# java
RUN mkdir -p /usr/java/default && \
    curl -Ls 'http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/jdk-8u121-linux-x64.tar.gz' -H 'Cookie: oraclelicense=accept-securebackup-cookie' | \
    tar --strip-components=1 -xz -C /usr/java/default/

ENV JAVA_HOME /usr/java/default
ENV PATH $PATH:$JAVA_HOME/bin
RUN ln -s $JAVA_HOME/bin/java /usr/bin/java

RUN curl -s http://apache.tt.co.kr/flume/$FLUME_VERSION/apache-flume-$FLUME_VERSION-bin.tar.gz | tar -xz -C /usr/local/
RUN cd /usr/local && ln -s ./apache-flume-$FLUME_VERSION-bin flume
ENV FLUME_HOME /usr/local/flume
ENV PATH $PATH:$FLUME_HOME/bin
