#!/bin/bash
docker login --username $HEROKU_DOCKER_USERNAME --password $HEROKU_API_KEY registry.heroku.com
docker build -t react-docker-travis:prod -f ./.docker/prod/Dockerfile .
docker tag react-docker-travis:prod registry.heroku.com/sudipotb2-react-docker-travis/web
docker push registry.heroku.com/sudipotb2-react-docker-travis/web
heroku container:release -a sudipotb2-react-docker-travis web
