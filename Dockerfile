FROM prographerj/ubuntu16-java8
MAINTAINER Prographer J<prographer.j@gmail.com>

USER root

ARG FLUME_VERSION=1.7.0

#install dev tools
RUN apt-get update
RUN apt-get install -y curl tar sudo openssh-server openssh-client net-tools

# flume
RUN curl -L http://apache.tt.co.kr/flume/$FLUME_VERSION/apache-flume-$FLUME_VERSION-bin.tar.gz | tar -xz -C /usr/local/
RUN cd /usr/local && ln -s ./apache-flume-$FLUME_VERSION-bin flume
ENV FLUME_HOME /usr/local/flume
ENV PATH $PATH:$FLUME_HOME/bin
