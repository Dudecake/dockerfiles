FROM ckoomen.eu/fedora-base

ENV NAME=fedora-lightdm VERSION=0 RELEASE=1

LABEL com.redhat.component="$NAME" name="$FGC/$NAME" version="$VERSION" release="$RELEASE.$DISTTAG" usage="docker run --rm --env-file <(env) --user=${USER} --workdir=\"$PWD\" --ipc $(docker inspect $(grep -o -e \"docker-.*.scope\" /proc/self/cgroup | head -n 1 | sed \"s/docker-\(.*\).scope/\\1/\") --format '{{.Name}}'| sed 's/^.//g') --network host $([[ -d /dev/dri ]] && echo \"--device=/dev/dri:/dev/dri\"; for dev in /dev/nvidia*; do echo \"--device=${dev}:${dev}\") --mount source=dbus-volume,target=/run/dbus --mount source=xdg-runtime,target=/run/user --mount source=lightdm-runtime,target=/run/lightdm --mount source=lightdm-data,target=/var/lib/lightdm-data --mount source=x11-volume,target=/tmp/.X11-unix --mount source=ice-volume,target=/tmp/.ICE-unix --mount type=bind,source=/home,target=/home --mount type=bind,source=/run/user,target=/run/user --mount type=bind,source=/etc/wpa_supplicant,target=/etc/wpa_supplicant --mount type=bind,source=/run/docker.sock,target=/run/docker.sock --mount type=bind,source=/lib/modules/$(uname -r),target=/lib/modules/$(uname -r) --mount type=bind,source=/etc/group,target=/etc/group,readonly --mount type=bind,source=/etc/passwd,target=/etc/passwd,readonly --mount type=bind,source=/etc/shadow,target=/etc/shadow,readonly --mount type=bind,source=/etc/sudoers.d,target=/etc/sudoers.d,readonly --mount type=bind,source=/etc/sssd,target=/etc/sssd,readonly --mount type=bind,source=/etc/machine-id,target=/etc/machine-id,readonly ckoomen/fedora-xfce"

#VOLUME ["/dev/dri", "/home", "/etc/sssd", "/etc/sudoers.d, "/run/docker.sock", "/etc/group", "/etc/passwd", "/etc/shadow", "/etc/machine-id", "/etc/hostname"]

RUN dnf install @xfce-desktop-environment -y && dnf clean all

ENTRYPOINT ["/usr/bin/startxfce4"]
