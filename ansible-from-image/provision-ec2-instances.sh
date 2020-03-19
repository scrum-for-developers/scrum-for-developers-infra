#!/bin/bash

# from https://medium.com/@Drew_Stokes/bash-argument-parsing-54f3b81a6a8f
PARAMS=""
while (( "$#" )); do
  case "$1" in
    --user-private-key)
      PRIVATE_KEY=$2
      echo "Private key to communicate with host: $PRIVATE_KEY"
      shift 2
      ;;
    --git-private-key)
      GIT_KEY=$2
      echo "Private key to clone git repos to host: $GIT_KEY"
      shift 2
      ;;
    --) # end argument parsing
      shift
      break
      ;;
    -*|--*=) # unsupported flags
      echo "Error: Unsupported flag $1" >&2
      exit 1
      ;;
    *) # preserve positional arguments
      PARAMS="$PARAMS $1"
      shift
      ;;
  esac
done

# set positional arguments in their proper place
eval set -- "$PARAMS"

if [ -z "$PRIVATE_KEY" ]
then
  echo "Usage $0 --user-private-key <private-key> [--git-private-key <path-to-private-key>]"
  exit 1
fi


ec2-dynamic-inventory/ec2.py --refresh-cache

ansible-playbook -v --diff --extra-vars "git_ssh_key_file=$GIT_KEY" \
  -i ec2-dynamic-inventory/ec2.py \
  -u ubuntu \
  --private-key ${PRIVATE_KEY} -e git_ssh_key_file \
  provision-ec2-playbook.yml
