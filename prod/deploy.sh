#!/bin/bash

echo "######################## IN DEPLOYMENT ########################"
source ./prod/digitalocean.env
export GIT_COMMIT_LATEST_HASH=$(git log -n 1 | head -n 1 | sed -e 's/^commit //' | head -c 8)
echo "${DO_TOKEN}"
echo "${DO_SIZE}"
echo "${DO_REGION}"
echo "GITHASH = ${GIT_COMMIT_LATEST_HASH}"
 

# exec /usr/local/bin/docker-machine create --driver ${DO_DRIVE} \
    # --digitalocean-access-token=${DO_TOKEN} \
    # --digitalocean-size=${DO_SIZE} \
    # --digitalocean-region=${DO_REGION} \
    # "${DO_INSTANCE}-${DO_REGION}-${DO_SIZE}-${GIT_COMMIT_LATEST_HASH}" 

echo "Setting Docker-Machine Enviroment"
/usr/local/bin/docker-machine env "${DO_INSTANCE}-${DO_REGION}-${DO_SIZE}-${GIT_COMMIT_LATEST_HASH}"
eval $(/usr/local/bin/docker-machine env "${DO_INSTANCE}-${DO_REGION}-${DO_SIZE}-${GIT_COMMIT_LATEST_HASH}")
echo "Copying over deplyment"
exec docker-machine scp -r ./docker "${DO_INSTANCE}-${DO_REGION}-${DO_SIZE}-${GIT_COMMIT_LATEST_HASH}":$PWD
echo "Executing Docker-Compose Production Build"
exec docker-compose -f docker-compose-prod.yml build
echo "Bringing up Docker containers on ${DO_INSTANCE}-${DO_REGION}-${DO_SIZE}-${GIT_COMMIT_LATEST_HASH}"
exec docker-compose up -d



