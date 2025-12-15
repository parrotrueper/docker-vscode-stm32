#!/usr/bin/env bash
# shellcheck source=/dev/null
. .env

# docker login -u parrotrueper
echo "runs on host"
docker image tag "${RESULT_IMAGE:?}" "${HUB_TAG:?}"
docker push "${HUB_TAG:?}"
