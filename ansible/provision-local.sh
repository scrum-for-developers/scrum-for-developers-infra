#!/bin/bash

export ANSIBLE_FORCE_COLOR=1

if [ $(uname) == "Darwin" ]
then
  INVENTORY=inventory-localhost-osx
else
  INVENTORY=inventory-localhost
fi

ansible-playbook \
  --connection=local \
  --inventory-file=$INVENTORY \
  provision-local-playbook.yml
