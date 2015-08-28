#! /bin/bash

docker rm $(docker ps -aq)
rm -rf mounted_directories/jenkins_home/*
rm -rf mounted_directories/jenkins_home/.jenkins
rm -rf mounted_directories/site_deploy/site/*
