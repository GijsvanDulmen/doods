#!/bin/bash
make libedgetpu
docker build -t 192.168.1.10:5000/iot/doods:amd64 -f Dockerfile.amd64 .
docker push 192.168.1.10:5000/iot/doods:amd64
