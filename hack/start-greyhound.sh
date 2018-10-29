#!/usr/bin/env bash

set -x

# requires OpenShift source-to-image (s2i) be installed

readonly builder="${BUILDER:-jwiii/greyhound-s2i}"
readonly server=example-pdal-greyhound
readonly points="${1:-https://github.com/jw3/example-pointcloud-source.git}"
readonly port="${PORT:-8080}"
readonly s2iopts="$S2I_OPTS"

# check for greyhound-s2i built image
docker images | grep -e "^$server" > /dev/null
declare -i needs_built=${?}

# if not present then build using entwine
if [[ ! -z ${BUILDER} || ${needs_built} -ne 0 ]]; then
  s2i build "$points" "$builder" "$server" "$s2iopts" -e http_proxy="$http_proxy" -e https_proxy="$https_proxy"
fi

# start greyhound
docker run --rm --name greyhound -it -p "$port:8080" "$server"
