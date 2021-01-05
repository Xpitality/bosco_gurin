#!/bin/bash
set -e

export WORKDIR

envsubst '${WORKDIR}' < /tmp/application.conf > /opt/bitnami/nginx/conf/server_blocks/default.conf &&
envsubst '${WORKDIR}' < /tmp/nginx.conf > /opt/bitnami/nginx/conf/nginx.conf

ls /opt/bitnami/nginx
ls /opt/bitnami/nginx/conf
ls /opt/bitnami/nginx/conf/server_blocks
cat /opt/bitnami/nginx/conf/server_blocks/default.conf

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
