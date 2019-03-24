# Setup of development environments for the scrum developer training

Development envrionment for the scrum for developers training told at
[codecentric](http://www.codecentric.de). The environment is based on [docker containers](http://www.docker.com)
containers, which are orchestrated via [docker-compose](https://docs.docker.com/compose/). The demo project
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
 * [Install docker-compose](https://docs.docker.com/compose/install/)
 * Run ```cd docker; docker-compose up```
 * Point your browser to <span>http://</span>*DOCKER_HOST_IP*

## Troubleshooting

### Docker container can't access mounted volumes
*Symptoms:* The jenkins container doesn't start up correctly, the log contains sth. like
```
mkdir: cannot create directory '/var/jenkins_home/plugins': Permission denied
```
or the *worblehat-020-quality* job fails with the error message
```
cp: cannot create regular file '/home/jenkins/site-deploy/site/integration.html': Permission denied
```

*Explanation:* The jenkins home directory and the site-deploy directory (which is used by the quality-job) are
mounted as a [docker volume](https://docs.docker.com/userguide/dockervolumes/#volume). The required
directories under `mounted_directories` must be readable/writable by the docker user.

*Solution:* The simplest solution is to grant write access to anybody for the `mounted_directories`
```
chmod -R a+w mounted_directories
```

## Provisioning via Ansible

### Manual changes after the provisioning
1. Generate a "personal access token" (https://git.fh-aachen.de/profile/personal_access_tokens)
2. Add new Credentials in jenkins
    * Navigate to /jenkins/credentials/store/system/domain/_/newCredentials
    * Use the token and your username as credentials
3. Change the repository URL
    * Navigate to the pipeline configuration (/jenkins/job/worblehat-pipelines/configure)
    * Change the "Project Repository" in the "Git" section and use the previously added credentials
4. Test the connection with a simple push to the master or rerun the last execution
