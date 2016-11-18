#!/bin/bash

ansible-galaxy install -p galaxy_roles \
  angstwad.docker_ubuntu,v1.1.1 \
  jdauphant.nginx,v1.11.2 \
  geerlingguy.java,1.3.0 \
  geerlingguy.jenkins,2.6.0 \
  geerlingguy.mysql,1.9.1
