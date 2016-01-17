#!/bin/bash

ansible-galaxy install -p galaxy_roles \
  angstwad.docker_ubuntu \
  jdauphant.nginx \
  geerlingguy.java \
  geerlingguy.jenkins \
  geerlingguy.sonar \
  geerlingguy.mysql
