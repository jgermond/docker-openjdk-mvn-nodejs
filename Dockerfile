FROM openjdk:8u162-jdk-slim-stretch

ARG MAVEN_VERSION=3.5.3
ARG NODEJS_VERSION=8.11.1

# Install requirements
RUN apt-get update && \
    apt-get install -y wget g++ make gnupg

# Install Maven
RUN cd /usr/local && \
    wget http://apache.mediamirrors.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz && \
    tar xzf apache-maven-$MAVEN_VERSION-bin.tar.gz && \
    rm apache-maven-$MAVEN_VERSION-bin.tar.gz && \
    ln -s apache-maven-$MAVEN_VERSION maven && \
    ln -s ../maven/bin/mvn bin/mvn

# Install nodejs
RUN cd /usr/local && \
    wget https://nodejs.org/dist/v$NODEJS_VERSION/node-v$NODEJS_VERSION-linux-x64.tar.xz && \
    tar xf node-v$NODEJS_VERSION-linux-x64.tar.xz && \
    rm node-v$NODEJS_VERSION-linux-x64.tar.xz && \
    ln -s node-v$NODEJS_VERSION-linux-x64 node && \
    ln -s ../node/bin/node bin/node && \
    ln -s ../node/bin/npm bin/npm && \
    ln -s ../node/bin/npx bin/npx
