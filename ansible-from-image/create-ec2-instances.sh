#!/bin/bash

export ANSIBLE_FORCE_COLOR=1

if [ $(uname) == "Darwin" ]
then
  INVENTORY=inventory-localhost-osx
else
  INVENTORY=inventory-localhost
fi

AWS_PROFILE=s4d

if [ "$#" -ne 1 ]
then
  echo "Usage $0 <private-key>"
  echo "The private key is the one to login to the machine via ssh as user 'ubuntu'. Usually a *.pem file."
  exit 1
fi

PRIVATE_KEY=$1
echo "Using private key $PRIVATE_KEY"
ansible-playbook \
  --connection=local \
  --inventory-file=$INVENTORY \
  -u ubuntu \
  --private-key ${PRIVATE_KEY} \
  create-ec2-playbook.yml
