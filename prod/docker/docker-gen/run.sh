
#!/bin/sh

/usr/local/bin/docker-gen -notify-sighup ${PROJECT}_${SERVICE}_1 \
    -watch /etc/docker-gen/templates/haproxy.tmpl \
    /usr/local/etc/haproxy/haproxy.cfg
# Debug Template
# /usr/local/bin/docker-gen  -only-exposed -notify-sighup ${PROJECT}_${SERVICE}_1 \
    -watch /etc/docker-gen/templates/debug.tmpl \
    /usr/local/etc/haproxy/debug.cfg