#!/usr/bin/env bash

if [ $(dpkg-query -W -f='${Status}' ansible 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  export DEBIAN_FRONTEND=noninteractive

  # Install the package that contains apt-add-repository
  # Wheezy and earlier: python-software-properties
  # Jessie and later: software-properties-common
  echo "installing basic packages"
  apt-get install -qq python-software-properties || exit 1

  echo "adding apt repository ppa:ansible/ansible"
  apt-add-repository ppa:ansible/ansible || exit 1

  apt-get update -qq

  echo "installing Ansible"
  apt-get install -qq ansible || exit 1
  echo "Ansible is now installed"
fi
