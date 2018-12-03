#!/usr/bin/env bash

#get needed stuff 1st
./setup.sh

#get needed stuff 1st
./download.sh

#clean anything with same name to get rid of clashes
docker-compose -f docker-compose.yml down

#update older jenkins image, make sure to remove intermediate containers
docker-compose build --force-rm
# #update older jenkins image, make sure it doesnt use cache
# docker-compose build --no-cache

#run built jenkins
docker-compose -f docker-compose.yml up -d
