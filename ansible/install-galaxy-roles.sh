#!/bin/bash

ansible-galaxy install -p galaxy_roles \
  jdauphant.nginx,v2.5 \
  geerlingguy.java,1.3.0 \
  geerlingguy.jenkins,2.6.0 \
  geerlingguy.mysql,2.4.2
