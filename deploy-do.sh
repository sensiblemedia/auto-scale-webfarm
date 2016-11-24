
docker-machine create \
    --driver digitalocean \
    --digitalocean-access-token=6766bb8582b1d78b959d16344a19bdca3efbc6740b36992d425e48605e44b7ad \
    --digitalocean-size=512mb \
    --digitalocean-region=lon1 \
    webfarm-a

docker-machine env webfarm-a
eval $(docker-machine env webfarm-a)

docker-machine ls
