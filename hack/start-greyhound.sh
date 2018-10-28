#!/usr/bin/env bash

set -x

# requires OpenShift source-to-image (s2i) be installed

readonly builder=jwiii/greyhound-s2i
readonly server=example-pdal-greyhound
readonly points=https://github.com/jw3/example-pointcloud-source.git
readonly port="${1:-8080}"

# check for greyhound-s2i built image
docker images | grep -e "^$server" > /dev/null
declare -i needs_built=${?}

# if not present then build using entwine
if [[ ${needs_built} -ne 0 ]]; then
  s2i build "$points" "$builder" "$server"
fi

# start greyhound
docker run --rm --name greyhound -it -p "$port:8080" "$server"
