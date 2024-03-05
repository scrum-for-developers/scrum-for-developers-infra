#!/bin/bash
./create-ec2-instances.sh $@
./provision-ec2-instances.sh --user-private-key $@