FROM jenkins:1.596

USER root

COPY plugins.txt /plugins.txt

RUN plugins.sh /plugins.txt

RUN apt-get update && apt-get install -y maven && rm -rf /var/lib/apt/lists/*

# ADD plugins/*.hpi /var/jenkins_plugins/

ADD jobs.tar.gz /usr/share/jenkins/ref/

RUN mkdir /var/jenkins_home/.m2 && chown jenkins:jenkins /var/jenkins_home/.m2
COPY settings.xml /var/jenkins_home/.m2/settings.xml

# Copy plugins and jobs and set correct ownership
# Otherwise we run into https://github.com/docker/docker/issues/783
#RUN mkdir /var/jenkins_home/plugins && \
#    cp -R /var/jenkins_plugins/* /var/jenkins_home/plugins/ && \
#    rm -rf /var/jenkins_plugins && \
#    mkdir /var/jenkins_home/jobs && \
#    cp -R /var/jenkins_jobs/* /var/jenkins_home/jobs/ && \
#    rm -rf /var/jenkins_jobs && \
#    chown -R jenkins:jenkins /var/jenkins_home

USER jenkins
