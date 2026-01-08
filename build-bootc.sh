#!/bin/bash

SCRIPTDIR="$(dirname "$(readlink -f "$0")")"

containers=(
  iot
  plasma
  cosmic
)

cd ${SCRIPTDIR}

today="$(date -u +%Y%m%d)"

podman pull registry.opensuse.org/opensuse/tumbleweed
pushd . > /dev/null
for container in ${containers[@]}; do
  popd > /dev/null
  pushd bootc-${container} > /dev/null
  podman build . --build-arg VERSION=${today} --cache-ttl=12h --dns=1.1.1.1 -t localhost.localdomain/bootc-${container}:${today} || continue
  podman tag localhost.localdomain/bootc-${container}:${today} localhost.localdomain/bootc-${container}:latest
  podman push localhost.localdomain/bootc-${container}:${today}
  localhost.localdomain/bootc-${container}:latest
done
