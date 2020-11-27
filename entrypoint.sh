#! /bin/bash
set -e

bundle exec rake db:migrate

if [[ $? != 0 ]]; then
  echo
  echo "== Failed to migrate. Running setup first."
  echo
  bundle exec rake db:setup
fi

# Remove a potentially pre-existing server.pid for Rails.
if [ -f "/app/tmp/pids/server.pid" ] ; then
    rm -f /app/tmp/pids/server.pid
fi

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
