# Setup of development environments for the scrum developer training

Development envrionment for the scrum for developers training told at
[codecentric](http://www.codecentric.de). The environment is based on [docker](http://www.docker.com)
containers, which are orchestrated via [fig](http://www.fig.sh). The demo project
build by this environment is the [worblehat library application](https://github.com/scrum-for-developers/worblehat)
The environment consists of:

 * [Jenkins](http://jenkins-ci.org) build server
 * [Artifactory](http://www.jfrog.com/artifactory/) artifact repository
 * [SonarQube](http://www.sonarqube.org/) quality analysis tool
 * [Tomcat](http://tomcat.apache.org) as test deployment environment for the worblehat application
 * [MySQL](http://www.mysql.com/) as data store for the worblehat application and for SonarQube
 * [nginx](http://nginx.org/) as reversed proxy for the other systems

## Run locally

 * [Install docker](https://docs.docker.com/installation/)
 * [Install fig.sh](http://www.fig.sh/install.html)
 * Run ```fig up```
 * Point your browser to ht<span>tp://</span>*DOCKER_HOST_IP*

## Provisioning via Ansible

TODO
