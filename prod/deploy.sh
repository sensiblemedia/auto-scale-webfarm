#!/bin/bash

echo "######################## IN DEPLOYMENT ########################"
source ./prod/digitalocean.env

echo "${DO_TOKEN}"
echo "${DO_SIZE}"
echo "${GIT_COMMIT_LATEST_HASH}"
githash="${GIT_COMMIT_LATEST_HASH}"
echo $githash
echo "Docker-machine create \
    --driver ${DO_DRIVE} \
    --digitalocean-access-token=${DO_TOKEN} \
    --digitalocean-size=${DO_SIZE} \
    --digitalocean-region=${DO_REGION} \
    ${DO_INSTANCE}-${DO_REGION}-${DO_SIZE}-${GIT_COMMIT_LATEST_HASH}" >> ${GIT_COMMIT_LATEST_HASH}

