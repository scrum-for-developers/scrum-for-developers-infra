#!/bin/bash

# the sshd does not see environment variables set by docker
# we write the SPRING_PROFILES_ACTIVE env var to the profile after start up
echo "# Spring WebApp Config" >> /opt/worblehat/application.properties
echo "server.context-path=/worblehat-$SPRING_PROFILES_ACTIVE" >> /opt/worblehat/application.properties

/usr/sbin/sshd -D
