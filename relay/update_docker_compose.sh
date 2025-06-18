#!/bin/bash

# Pull the latest image
docker-compose pull

# Get the image ID of the currently running container
CURRENT_IMAGE_ID=$(docker inspect --format='{{.Image}}' $(docker ps -q --filter "name=relay"))

# Get the image ID of the latest image
LATEST_IMAGE_ID=$(docker inspect --format='{{.Id}}' ltonetwork/relay:latest)

# Compare the image IDs
if [ "$CURRENT_IMAGE_ID" != "$LATEST_IMAGE_ID" ]; then
  # Restart the container with the latest image
  docker-compose down
  docker-compose up -d
fi

