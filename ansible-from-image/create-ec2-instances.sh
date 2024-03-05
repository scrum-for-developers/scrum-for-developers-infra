#!/bin/bash

export ANSIBLE_FORCE_COLOR=1
export ANSIBLE_LOCALHOST_WARNING=False
export ANSIBLE_INVENTORY_UNPARSED_WARNING=False
export AWS_PROFILE=s4d

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
    -u ubuntu \
  --private-key ${PRIVATE_KEY} \
  create-ec2-playbook.yml
