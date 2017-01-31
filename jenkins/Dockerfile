FROM jenkins:2.32.1
MAINTAINER Ordina <no-reply@ordina.nl>

ENV JENKINS_OPTS "--prefix=/jenkins"

USER root
RUN apt-get update \
 && apt-get install wget curl apt-transport-https openjdk-8-jre maven -y \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER jenkins

RUN /usr/local/bin/install-plugins.sh ansicolor:0.4.2 greenballs:1.15 mask-passwords:2.9 scm-api:1.3 git-client:2.2.1 git:3.0.1
