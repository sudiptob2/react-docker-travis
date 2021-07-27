#!/bin/bash
docker login --username $HEROKU_DOCKER_USERNAME --password $HEROKU_API_KEY registry.heroku.com
docker build -t react-docker-travis:dev -f ./.docker/prod/Dockerfile .
docker tag react-docker-travis:dev registry.heroku.com/sudipotb2-react-travis-dev/web
docker push registry.heroku.com/sudipotb2-react-travis-dev/web
heroku container:release -a sudipotb2-react-travis-dev web
