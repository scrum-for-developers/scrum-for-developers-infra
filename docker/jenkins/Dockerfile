FROM jenkins:1.596

USER root

RUN apt-get update && apt-get install -y maven && rm -rf /var/lib/apt/lists/*
COPY settings.xml /usr/share/jenkins/ref/.m2/settings.xml

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN plugins.sh /usr/share/jenkins/ref/plugins.txt

ADD jobs /usr/share/jenkins/ref/jobs

ENV JENKINS_OPTS --prefix=/jenkins

USER jenkins
