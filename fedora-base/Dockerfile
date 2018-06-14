FROM registry.fedoraproject.org/fedora:28

ENV container=docker ARCH=x86_64

LABEL architecture="$ARCH" maintainer=coen_koomen@ckoomen.eu

ADD sssd.patch /sssd.patch

RUN dnf install sssd patch -y && dnf clean all && systemctl enable sssd && patch -Np1 -i /sssd.patch
