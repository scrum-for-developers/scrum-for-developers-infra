#! /bin/bash

docker-compose stop
docker rm $(docker ps -aq)
