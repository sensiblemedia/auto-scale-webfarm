FROM alpine:latest
MAINTAINER Jason Wilder <mail@jasonwilder.com>

RUN apk -U add openssl

ENV VERSION 0.7.3
ENV DOWNLOAD_URL https://github.com/jwilder/docker-gen/releases/download/$VERSION/docker-gen-alpine-linux-amd64-$VERSION.tar.gz
ENV DOCKER_HOST unix:///tmp/docker.sock

RUN wget -qO- $DOWNLOAD_URL | tar xvz -C /usr/local/bin

COPY haproxy.tmpl /etc/docker-gen/templates/haproxy.tmpl 
COPY debug.tmpl /etc/docker-gen/templates/debug.tmpl
COPY run.sh /run.sh 
RUN chmod +x /run.sh 

ENTRYPOINT ["/bin/sh", "-c"] 
CMD ["/run.sh"]


