#!/bin/bash

if [ "$#" -ne 1 ]
then
  echo "Usage $0 <private-key>"
  exit 1
fi

PRIVATE_KEY=$1
echo "Using private key $PRIVATE_KEY"

AWS_PROFILE=s4d
ec2-dynamic-inventory/ec2.py --refresh-cache

ansible-playbook -v --diff \
  -i ec2-dynamic-inventory/ec2.py \
  -u ubuntu \
  --private-key ${PRIVATE_KEY} \
  provision-ec2-playbook.yml
