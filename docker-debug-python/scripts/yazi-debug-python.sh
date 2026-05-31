#!/usr/bin/env bash
# Detect which Heiberg project the given file belongs to, ensure the debug
# backend container is running (starts it if not), then open the file in nvim.
# Called from Yazi: shell 'yazi-debug-python %h' --block

set -euo pipefail

FILE="${1:-}"
if [[ -z "$FILE" ]]; then
  echo "Usage: yazi-debug-python <file>" >&2
  exit 1
fi

HEIBERG="$HOME/Development/heiberg-systems"

if [[ "$FILE" == *"/eating-plan/"* ]]; then
  PROJECT="eating-plan"
  COMPOSE_DIR="$HEIBERG/eating-plan/app"
  PORT=5678
elif [[ "$FILE" == *"/workout-plan/"* ]]; then
  PROJECT="workout-plan"
  COMPOSE_DIR="$HEIBERG/workout-plan/app"
  PORT=5679
else
  echo "File is not inside a known Heiberg project (eating-plan, workout-plan)." >&2
  echo "Opening in nvim without debug setup." >&2
  exec nvim "$FILE"
fi

# Check if debugpy is already listening on the expected port
if nc -z 127.0.0.1 "$PORT" 2>/dev/null; then
  echo "Debug port $PORT already open for $PROJECT — attaching."
else
  echo "Starting debug backend for $PROJECT on port $PORT..."
  (cd "$COMPOSE_DIR" && docker compose -f docker-compose.yml -f docker-compose.debug.yml up backend --no-log-prefix &)

  TIMEOUT=30
  ELAPSED=0
  while ! nc -z 127.0.0.1 "$PORT" 2>/dev/null; do
    if (( ELAPSED >= TIMEOUT )); then
      echo "Timed out waiting for port $PORT after ${TIMEOUT}s." >&2
      echo "Check: docker compose logs backend" >&2
      exit 1
    fi
    sleep 1
    (( ELAPSED++ ))
  done
  echo "Debug backend ready."
fi

exec nvim "$FILE"
