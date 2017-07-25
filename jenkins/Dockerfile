FROM jenkins:2.60.2
MAINTAINER Ordina <no-reply@ordina.nl>

ENV JENKINS_OPTS "--prefix=/jenkins"

USER root
RUN apt-get update \
 && apt-get install wget curl apt-transport-https -y \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV MAVEN_VERSION 3.3.9
RUN \
    curl -sSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share && \
    mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven && \
    ln -s /usr/share/maven/bin/mvn /usr/bin/mvn
ENV MAVEN_HOME /usr/share/maven

# shared volume for tomcat
RUN mkdir /tomcat-webapps-volume && chown jenkins /tomcat-webapps-volume
VOLUME /tomcat-webapps-volume
RUN chmod 666 -R /tomcat-webapps-volume

USER jenkins

RUN /usr/local/bin/install-plugins.sh \
  artifactory:2.12.1 \
  git:3.4.1 \
  git-client:2.4.6 \
  greenballs:1.15 \
  mask-passwords:2.10.1 \
  maven-plugin:2.17 \
  scm-api:2.2.0 \
  workflow-cps:2.13

ENV JENKINS_ARGS="--prefix=/jenkins"
COPY ./data/ /var/jenkins_home/

USER root
RUN chown -R jenkins:jenkins /var/jenkins_home
