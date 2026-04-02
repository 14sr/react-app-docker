#!/bin/bash

#login into DockerHub:
docker login -u $DOCKER_USERNAME -p $DOCKER_PASS

#stopping existing container:
docker stop react
docker rm react

#building a image:
docker build -t app .

#running a container from the created image:
docker run -d -it --name react -p 80:80 app

#pushing the image to dockerhub:
docker tag app srilekhadevops10/application:ci-cd
docker push srilekhadevops10/application:ci-cd
