#! /bin/bash
set -u
set -e

docker pull structurizr/lite:latest;
docker run -it --rm -p 8080:8080 -v ${PWD}:/usr/local/structurizr structurizr/lite
