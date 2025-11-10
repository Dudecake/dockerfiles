#!/bin/bash

SCRIPTDIR="$(dirname "$(readlink -f "$0")")"

containers=(
  base
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
  pushd opensuse-${container} > /dev/null
  podman build . --build-arg VERSION=${today} --cache-ttl=12h --dns=1.1.1.1 -t localhost.localdomain/opensuse-${container}:${today} || continue
  podman tag localhost.localdomain/opensuse-${container}:${today} localhost.localdomain/opensuse-${container}:latest
done
