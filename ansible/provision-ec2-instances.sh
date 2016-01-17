#!/bin/bash

if [ "$#" -ne 1 ]; then
then
  echo "Usage $0 <private-key>"
  exit 1
fi

PRIVATE_KEY=$1
echo "Using private key $PRIVATE_KEY"

ansible-playbook -v \
  -i ec2-dynamic-inventory/ec2.py \
  -u ec2-user \
  --private-key ${PRIVATE_KEY} \
  provision-ec2-playbook.yml
