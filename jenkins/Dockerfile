FROM jenkins:2.32.1
MAINTAINER Ordina <no-reply@ordina.nl>

USER root
RUN apt-get update \
 && apt-get install wget curl apt-transport-https docker.io -y \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER jenkins

COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/install-plugins.sh /usr/share/jenkins/plugins.txt

ENV --prefix=/jenkins