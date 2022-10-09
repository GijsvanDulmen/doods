#!/bin/bash
docker run -it -v $(pwd):/home tensorflow/tensorflow:latest /bin/bash

# Build image
docker build -t 192.168.1.10:5000/iot/edgetpucompiler:latest -f Dockerfile.edgetpucompiler .

docker run -it -v $(pwd):/home 192.168.1.10:5000/iot/edgetpucompiler:latest /bin/bash

# alternative image
docker run -it -v $(pwd):/home debian:latest /bin/bash
apt-get update
apt-get install curl gnupg
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

echo "deb https://packages.cloud.google.com/apt coral-edgetpu-stable main" | tee /etc/apt/sources.list.d/coral-edgetpu.list

apt-get update

apt-get install edgetpu-compiler

