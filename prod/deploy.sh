#!/bin/bash

echo "######################## IN DEPLOYMENT ########################"
source ./prod/digitalocean.env
export GIT_COMMIT_LATEST_HASH=$(git log -n 1 | head -n 1 | sed -e 's/^commit //' | head -c 8)
echo "${DO_TOKEN}"
echo "${DO_SIZE}"
echo "${DO_REGION}"
echo "GITHASH = ${GIT_COMMIT_LATEST_HASH}"
 

exec /usr/local/bin/docker-machine create --driver ${DO_DRIVE} --digitalocean-access-token=${DO_TOKEN} --digitalocean-size=${DO_SIZE} --digitalocean-region=${DO_REGION} "${DO_INSTANCE}-${DO_REGION}-${DO_SIZE}-${GIT_COMMIT_LATEST_HASH}" 



