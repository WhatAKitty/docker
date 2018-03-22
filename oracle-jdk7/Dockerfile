FROM whatakitty/ubuntu:14.04

MAINTAINER WhatAKitty 104xuqiang@gmail.com

ENV JAVA_HOME /usr/lib/jvm/java-7-oracle
ENV TEMP_PATH /tmp/java7

# TEMP 
RUN mkdir -p "${TEMP_PATH}"
COPY jdk-7u80-linux-x64.tar.gz "${TEMP_PATH}/jdk-7u80-linux-x64.tar.gz"

# Install Java.
RUN \
  mkdir -p /var/cache/oracle-jdk7-installer && \
  cp "${TEMP_PATH}/jdk-7u80-linux-x64.tar.gz" "/var/cache/oracle-jdk7-installer/jdk-7u80-linux-x64.tar.gz" && \
  echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java7-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk7-installer

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]
