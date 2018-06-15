# dockerfiles

This repo contains Dockerfiles for running a desktop environment in Docker containers. It is based on Fedora 28 and on CoreOS requires some setup with users. On Fedora Server it should run without ussues.

## Usage

```bash
docker run --rm [--privileged|$(for dev in /dev/tty* /dev/hugepages* /dev/nvidia*; do echo \"--device=${dev}:${dev}; done\"; [[ -d /dev/dri ]] && echo \"--device=/dev/dri:/dev/dri\"); [[ -d /dev/input]] && \"--device=/dev/input:/dev/input\"] --mount type=bind,source=/home,target=/home --mount type=bind,source=/run/docker.sock,target=/tmp/docker.sock --mount type=bind,source=/lib/modules/$(uname -r),target=/lib/modules/$(uname -r) --mount type=bind,source=/etc/group,target=/etc/group,readonly --mount type=bind,source=/etc/passwd,target=/etc/passwd,readonly --mount type=bind,source=/etc/shadow,target=/etc/shadow,readonly --mount type=bind,source=/etc/sudoers.d,target=/etc/sudoers.d,readonly --mount type=bind,source=/etc/sssd,target=/etc/sssd,readonly --mount type=bind,source=/etc/machine-id,target=/etc/machine-id,readonly ckoomen/fedora-lightdm

```

## TODO

- Make container unprivileged
- Passthrough a subset of devices with `--device`

## Disclaimer

This container requires that the host does not run X
This container has been known to kick puppies and eat data. Keep out of reach of children and pets.
