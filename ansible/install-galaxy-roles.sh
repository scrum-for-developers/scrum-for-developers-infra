#!/bin/bash

ansible-galaxy role install -p galaxy_roles \
  jdauphant.nginx,v2.21.2 \
  geerlingguy.jenkins,3.8.0 \
  geerlingguy.mysql,3.3.0 \
  geerlingguy.postgresql,2.2.1 \
  geerlingguy.docker,2.6.1 \
  geerlingguy.java,1.10.0