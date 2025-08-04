#!/bin/bash

SCRIPTDIR="$(dirname "$(readlink -f "$0")")"

containers=(
  base
#  iot
  plasma
)

set -e
cd ${SCRIPTDIR}

today="$(date -u +%Y%m%d)"

podman pull registry.opensuse.org/opensuse/tumbleweed
for container in ${containers[@]}; do
  pushd opensuse-${container} > /dev/null
  podman build . --build-arg VERSION=${today} -t localhost.localdomain/opensuse-${container}:${today}
  popd > /dev/null
done
