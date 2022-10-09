#!/bin/bash
DOCKER_BUILDKIT=0 docker build -t imageregistry.ticq.dev/iot/doods:cuda -f Dockerfile.base.cuda .
docker push imageregistry.ticq.dev/iot/doods:cuda