#!/bin/bash
set -e

envsubst '${WORKDIR}' < /tmp/application.conf > /opt/bitnami/nginx/conf/server_blocks/default.conf 
envsubst '${WORKDIR}' < /tmp/nginx.conf > /opt/bitnami/nginx/conf/nginx.conf

echo "NGINX"
ls /opt/bitnami/nginx
echo "NGINX CONF"
ls /opt/bitnami/nginx/conf
echo "SERVER BLOCKS"
ls /opt/bitnami/nginx/conf/server_blocks
echo "APP"
cat /opt/bitnami/nginx/conf/server_blocks/default.conf

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
