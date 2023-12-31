#!/bin/bash

BRANCH=$1
TAG=$2
REPO=$3

if [ -z "$BRANCH" ]; then
    BRANCH="master"
fi

if [ -z "$TAG" ]; then
    TAG=${BRANCH}
fi

if [ -z "$REPO" ]; then
    REPO="https://github.com/DubOliver/BFuplicate.git"
fi

echo "using ${TAG} -> ${BRANCH} (${REPO})"

docker build ./build/4.4.0 -f build/4.4.0/Dockerfile --tag "betaflight/BFcloudbuild:${TAG}" --build-arg NOCACHE=$(date +%s) --build-arg COMMIT=${BRANCH} --build-arg REPO=${REPO}
