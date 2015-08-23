#!/bin/bash

# the sshd does not see environment variables set by docker
# we write the SPRING_PROFILES_ACTIVE env var to the profile after start up
echo "export SPRING_PROFILES_ACTIVE=$SPRING_PROFILES_ACTIVE" >> /etc/profile

/usr/sbin/sshd -D
