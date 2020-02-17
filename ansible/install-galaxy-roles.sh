#!/bin/bash

ansible-galaxy install -p galaxy_roles \
  jdauphant.nginx,v2.21.2 \
  geerlingguy.jenkins,3.8.0 \
  geerlingguy.mysql,2.9.5 \
  geerlingguy.postgresql,2.0.1