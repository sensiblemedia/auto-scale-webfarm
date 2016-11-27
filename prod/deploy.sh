#!/bin/bash

echo "######################## IN DEPLOYMENT ########################"
source ./prod/digitalocean.env
export GIT_COMMIT_LATEST_HASH=$(git log -n 1 | head -n 1 | sed -e 's/^commit //' | head -c 8)
#GIT_COMMIT_LATEST_HASH=d92f1428
echo "${DO_TOKEN}"
echo "${DO_SIZE}"
echo "${DO_REGION}"
echo "GITHASH = ${GIT_COMMIT_LATEST_HASH}"
 

/usr/local/bin/docker-machine create --driver ${DO_DRIVE} \
       --digitalocean-access-token=${DO_TOKEN} \
       --digitalocean-size=${DO_SIZE} \
       --digitalocean-region=${DO_REGION} \
     "${DO_INSTANCE}-${DO_REGION}-${DO_SIZE}-${GIT_COMMIT_LATEST_HASH}" 

echo "Setting Docker-Machine Enviroment"
/usr/local/bin/docker-machine env "${DO_INSTANCE}-${DO_REGION}-${DO_SIZE}-${GIT_COMMIT_LATEST_HASH}"
eval $(/usr/local/bin/docker-machine env "${DO_INSTANCE}-${DO_REGION}-${DO_SIZE}-${GIT_COMMIT_LATEST_HASH}")
sleep 4
echo "Copying over deplyment"
docker-machine ssh "${DO_INSTANCE}-${DO_REGION}-${DO_SIZE}-${GIT_COMMIT_LATEST_HASH}" mkdir -p /Users/sg/Documents/docker/auto-scale-webfarm/
docker-machine scp -r /Users/sg/Documents/docker/auto-scale-webfarm/docker "${DO_INSTANCE}-${DO_REGION}-${DO_SIZE}-${GIT_COMMIT_LATEST_HASH}":$PWD
echo "Executing Docker-Compose Production Build"
docker-compose -f docker-compose-prod.yml build
echo "Bringing up Docker containers on ${DO_INSTANCE}-${DO_REGION}-${DO_SIZE}-${GIT_COMMIT_LATEST_HASH}"
docker-compose up -d



