#!/usr/bin/env bash

DATADIR=~/data/docker-jenkins
JENKINSPORT=8083

if [ ! -d ${DATADIR}  ]; then
  mkdir -p ${DATADIR}
fi

docker run -u root  --name jenkins2 --rm -d -p ${JENKINSPORT}:8080 -v ${DATADIR}:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -v ~/:/home jenkinsci/blueocean 
