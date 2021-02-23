#!/bin/bash

if [ "$#" -ne 1 ]
then
  echo "Usage $0 <private-key>"
  exit 1
fi

PRIVATE_KEY=$1
echo "Using private key $PRIVATE_KEY"


ansible-playbook -v --diff \
  -i teamservers.aws_ec2.yml \
  -u ubuntu \
  --private-key ${PRIVATE_KEY} \
  provision-ec2-playbook.yml
