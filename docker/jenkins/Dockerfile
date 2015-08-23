FROM java:8-jdk

RUN apt-get update && apt-get install -y wget git curl zip && rm -rf /var/lib/apt/lists/*

# apt-get install maven will install maven 3.0.5 which does not work with maven-site-plugin 3.4
# -> install maven 3.3.3 by hand
RUN wget http://mirror.catn.com/pub/apache/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz \
    && tar -zxf apache-maven-3.3.3-bin.tar.gz \
    && cp -R apache-maven-3.3.3 /usr/local \
    && ln -s /usr/local/apache-maven-3.3.3/bin/mvn /usr/bin/mvn \
    && ln -s /usr/local/apache-maven-3.3.3/bin/mvnDebug /usr/bin/mvnDebug \
    && ln -s /usr/local/apache-maven-3.3.3 /usr/share/maven

ENV MAVEN_HOME /usr/share/maven
ENV JENKINS_HOME /var/jenkins_home

# Jenkins is ran with user `jenkins`, uid = 1000
# If you bind mount a volume from host/vloume from a data container,
# ensure you use same uid
RUN useradd -d "$JENKINS_HOME" -u 1000 -m -s /bin/bash jenkins

# Jenkins home directoy is a volume, so configuration and build history
# can be persisted and survive image upgrades
VOLUME /var/jenkins_home

# `/usr/share/jenkins/ref/` contains all reference configuration we want
# to set on a fresh new installation. Use it to bundle additional plugins
# or config file with your custom jenkins Docker image.
RUN mkdir -p /usr/share/jenkins/ref/init.groovy.d

COPY init.groovy /usr/share/jenkins/ref/init.groovy.d/tcp-slave-angent-port.groovy

ENV JENKINS_VERSION 1.601

# could use ADD but this one does not check Last-Modified header
# see https://github.com/docker/docker/issues/8331
RUN curl -L http://mirrors.jenkins-ci.org/war/1.601/jenkins.war -o /usr/share/jenkins/jenkins.war

ENV JENKINS_UC https://updates.jenkins-ci.org
RUN chown -R jenkins "$JENKINS_HOME" /usr/share/jenkins/ref

# for main web interface:
EXPOSE 8080

# will be used by attached slave agents:
EXPOSE 50000

COPY jenkins.sh /usr/local/bin/jenkins.sh

ENTRYPOINT ["/usr/local/bin/jenkins.sh"]

# from a derived Dockerfile, can use `RUN plugin.sh active.txt` to setup /usr/share/jenkins/ref/plugins from a support bundle
COPY plugins.sh /usr/local/bin/plugins.sh
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN plugins.sh /usr/share/jenkins/ref/plugins.txt

# Here comes our special scrum-for-developers-training configuration
COPY settings.xml /usr/share/jenkins/ref/.m2/settings.xml
COPY config.xml /usr/share/jenkins/ref/config.xml
COPY org.jfrog.hudson.ArtifactoryBuilder.xml /usr/share/jenkins/ref/org.jfrog.hudson.ArtifactoryBuilder.xml
COPY hudson.tasks.Maven.xml /usr/share/jenkins/ref/hudson.tasks.Maven.xml
ADD jobs /usr/share/jenkins/ref/jobs

ENV JENKINS_OPTS --prefix=/jenkins

USER jenkins
