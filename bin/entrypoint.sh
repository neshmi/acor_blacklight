#!/usr/bin/env bash
set -e

rm -f /app/tmp/pids/server.pid
exec bundle exec rails s -p 3000 -b 0.0.0.0