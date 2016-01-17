#!/bin/bash

ansible-galaxy install -p galaxy_roles \
  angstwad.docker_ubuntu \
  jdauphant.nginx \
  geerlingguy.jenkins \
  geerlingguy.sonar \
  geerlingguy.mysql 
