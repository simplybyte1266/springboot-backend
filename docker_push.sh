#!/usr/bin/env bash
set -e

# Build the backend jar and image
./mvnw clean install -DskipTests=true
docker build -t simplybyte/simplybyte-backend:1.0 .

# Log in to Docker Hub.
# Do NOT hardcode credentials in this file.
# Set them in your shell before running, e.g.:
#   export DOCKER_USER=your-username
#   export DOCKER_TOKEN=your-access-token
echo "$DOCKER_TOKEN" | docker login -u "$DOCKER_USER" --password-stdin

# Push
docker push simplybyte/simplybyte-backend:1.0
