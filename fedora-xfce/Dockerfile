FROM ckoomen.eu/fedora-base

ENV NAME=fedora-lightdm VERSION=0 RELEASE=1

LABEL com.redhat.component="$NAME" name="$FGC/$NAME" version="$VERSION" release="$RELEASE.$DISTTAG"

RUN dnf install @xfce-desktop-environment -y && dnf clean all

ENTRYPOINT ["/usr/bin/startxfce4"]
