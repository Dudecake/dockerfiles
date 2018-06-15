FROM ckoomen.eu/ckoomen/fedora-base

ENV NAME=fedora-lightdm VERSION=0 RELEASE=1

LABEL com.redhat.component="$NAME" name="$FGC/$NAME" version="$VERSION" release="$RELEASE.$DISTTAG" usage="docker run --rm [--privileged|$(for dev in /dev/tty* /dev/hugepages* /dev/nvidia*; do echo \"--device=${dev}:${dev}; done\"; [[ -d /dev/dri ]] && echo \"--device=/dev/dri:/dev/dri\"); [[ -d /dev/input]] && \"--device=/dev/input:/dev/input\"] --mount type=bind,source=/home,target=/home --mount type=bind,source=/run/docker.sock,target=/tmp/docker.sock --mount type=bind,source=/lib/modules/$(uname -r),target=/lib/modules/$(uname -r) --mount type=bind,source=/etc/group,target=/etc/group,readonly --mount type=bind,source=/etc/passwd,target=/etc/passwd,readonly --mount type=bind,source=/etc/shadow,target=/etc/shadow,readonly --mount type=bind,source=/etc/sudoers.d,target=/etc/sudoers.d,readonly --mount type=bind,source=/etc/sssd,target=/etc/sssd,readonly --mount type=bind,source=/etc/machine-id,target=/etc/machine-id,readonly ckoomen/fedora-lightdm"

#VOLUME ["/dev/dri", "/dev/hugepages", "/dev/input", "/home", "/etc/sssd", "/etc/sudoers.d, "/run/docker.sock", "/etc/group", "/etc/passwd", "/etc/shadow", "/etc/machine-id", "/etc/hostname"]

STOPSIGNAL SIGRTMIN+3

ADD entrypoint.sh /entrypoint
ADD i3.desktop /usr/share/xsessions/i3.desktop
ADD xfce.desktop /usr/share/xsessions/xfce.desktop
ADD sway.desktop /usr/share/xsessions/sway.desktop

RUN dnf install lightdm-gtk sudo docker plymouth xorg-x11-drivers mesa-{dri,vulkan}-drivers -y && dnf clean all

RUN sed -i 's/#minimum-vt=./minimum-vt=7/g' /etc/lightdm/lightdm.conf && systemctl set-default graphical.target && systemctl enable lightdm && systemctl unmask systemd-logind && systemctl mask auditd polkit systemd-{machine-id-commit,sysusers,tmpfiles-setup,remount-fs} anaconda.target

ENTRYPOINT ["/entrypoint"]
