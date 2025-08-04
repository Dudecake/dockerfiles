ARG VERSION=latest

FROM localhost.localdomain/opensuse-base:${VERSION}

RUN zypper install -y patterns-dudecake-hw-accel && \
    zypper clean -a

RUN zypper addrepo -p120 https://download.opensuse.org/repositories/home:cloud-hypervisor/openSUSE_Tumbleweed/home:cloud-hypervisor.repo && \
    echo -e '[virtio-win-latest]\nname=Latest virtio-win builds\nenabled=1\nautorefresh=1\nbaseurl=http://fedorapeople.org/groups/virt/virtio-win/repo/latest\ngpgcheck=0\npriority=120' > /etc/zypp/repos.d/virtio-win-latest.repo && \
    zypper --gpg-auto-import-keys refresh && \
    zypper install -y patterns-dudecake-virtualization && \
    zypper clean -a

RUN zypper addrepo -p120 https://download.opensuse.org/repositories/filesystems/openSUSE_Tumbleweed/filesystems.repo && \
    zypper --gpg-auto-import-keys refresh && \
    zypper install -y kernel-longterm-devel patterns-microos-cockpit patterns-dudecake-iot && \
    zypper clean -a
