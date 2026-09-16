#!/usr/bin/env bash

set -e

echo "Waiting for Docker..."

for i in {1..60}; do
    if docker info >/dev/null 2>&1; then
        break
    fi

    sleep 2
done

if ! docker info >/dev/null 2>&1; then
    echo "Docker did not become ready."
    exit 1
fi

echo "Starting Linux desktop..."

docker compose \
    -f .devcontainer/compose.yaml \
    up -d

echo
echo "Linux desktop is running."
echo "Open forwarded port 6080 in the Codespaces PORTS tab."
