#!/bin/bash

useradd jenkins -m
docker run \
  -u jenkins \
  --rm \
  -d \
  -p 8080:8080 \
  -p 50000:50000 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /home/jenkins:/var/jenkins_home \
  jenkins/jenkins:lts
cat /home/jenkins/secrets/initialAdminPassword

