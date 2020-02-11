#!/bin/bash

ansible-galaxy install -p galaxy_roles \
  jdauphant.nginx,v2.18.1 \
  geerlingguy.java,1.8.1 \
  geerlingguy.jenkins,3.5.0 \
  geerlingguy.mysql,2.9.4
