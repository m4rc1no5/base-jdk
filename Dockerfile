FROM jboss/base:latest
MAINTAINER Marek Goldmann <mgoldman@redhat.com>

# User root user to install software
USER root

# Install OpenJDK 11
WORKDIR /opt
RUN yum install wget -y \
	&& wget https://download.java.net/java/ga/jdk11/openjdk-11_linux-x64_bin.tar.gz \
	&& tar zxvf openjdk-11_linux-x64_bin.tar.gz \
	&& rm -f openjdk-11_linux-x64_bin.tar.gz
ENV JAVA_HOME=/opt/jdk-11
WORKDIR ~/

# Switch back to jboss user
USER jboss

# Set the JAVA_HOME variable to make it clear where Java is located
ENV JAVA_HOME /usr/lib/jvm/java
