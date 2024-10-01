#!/bin/bash

DOCKER_IMAGE="$1"  # Store the first argument as Docker image name
DOCKER_PLATFORMS="$2"  # Store the second argument as platforms (e.g., linux/amd64)
TAG_NAME="$3"  # Store the third argument as the tag name

if [[ ${TAG_NAME} == *dev* ]]; then
  DOCKER_IMAGE_TAGS="--tag ${DOCKER_IMAGE}:${TAG_NAME}"
else
  DOCKER_IMAGE_TAGS="--tag ${DOCKER_IMAGE}:${TAG_NAME} --tag ${DOCKER_IMAGE}:latest"
fi

BUILD_ARGS="--platform ${DOCKER_PLATFORMS}"
BUILD_ARGS+=" --build-arg DOCKER_IMAGE_TAG=${TAG_NAME}"
BUILD_ARGS+=" --build-arg BUILD_AT=$(TZ=America/Toronto date +'%Y-%m-%dT%H:%M')"
BUILD_ARGS+=" --build-arg GITHUB_COMMIT=$(git rev-parse --short HEAD)"
BUILD_ARGS+=" --no-cache"
BUILD_ARGS+=" ${DOCKER_IMAGE_TAGS}"

echo "Building image: ${DOCKER_IMAGE} with platforms: ${DOCKER_PLATFORMS}"

docker buildx build --output "type=image" ${BUILD_ARGS} -f installer/Dockerfile .

echo "Image build complete."