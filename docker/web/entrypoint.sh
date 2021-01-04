#! /bin/bash
set -e

export WORKDIR

envsubst '${WORKDIR}' < /tmp/application.conf > /etc/nginx/conf.d/default.conf &&
envsubst '${WORKDIR}' < /tmp/nginx.conf > /etc/nginx/nginx.conf

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
