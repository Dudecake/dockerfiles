ARG VERSION=latest

FROM localhost.localdomain/microos-base:${VERSION}

RUN zypper install -y patterns-dudecake-hw-accel && \
    zypper clean -a

#ARG ZED_VERSION=0.211.6
#ARG ZED_ARCH=x86_64

RUN zypper addrepo -fp120 https://download.opensuse.org/repositories/home:cloud-hypervisor/openSUSE_Tumbleweed/home:cloud-hypervisor.repo && \
    echo -e '[virtio-win-latest]\nname=Latest virtio-win builds\nenabled=1\nautorefresh=1\nbaseurl=http://fedorapeople.org/groups/virt/virtio-win/repo/latest\ngpgcheck=0\npriority=120' > /etc/zypp/repos.d/virtio-win-latest.repo && \
    zypper --gpg-auto-import-keys refresh && \
    zypper install -y patterns-dudecake-virtualization && \
    zypper clean -a

RUN zypper addrepo -fp120 https://download.opensuse.org/repositories/editors/openSUSE_Tumbleweed/editors.repo && \
    zypper addrepo -fp120 https://download.opensuse.org/repositories/home:dudecake:compat/openSUSE_Tumbleweed/home:dudecake:compat.repo && \
    echo -e '[vscode]\nname=Visual Studio Code\nenabled=1\nautorefresh=1\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc\npriority=120' > /etc/zypp/repos.d/vscode.repo && \
    zypper --gpg-auto-import-keys refresh && \
    zypper install -y --force-resolution patterns-dudecake-desktop-applications ghostty && \
    zypper clean -a

#RUN curl -L https://github.com/zed-industries/zed/releases/download/v${ZED_VERSION}/zed-linux-${ZED_ARCH}.tar.gz | tar -C /opt -xzf -

RUN zypper addrepo -fp120 https://download.opensuse.org/repositories/Emulators/openSUSE_Tumbleweed/Emulators.repo && \
    zypper addrepo -fp120 https://download.opensuse.org/repositories/games/openSUSE_Tumbleweed/games.repo && \
    zypper addrepo -fp130 https://download.opensuse.org/repositories/X11:COSMIC:Next/openSUSE_Factory/X11:COSMIC:Next.repo && \
    zypper --gpg-auto-import-keys refresh && \
    zypper install -y --force-resolution \
        patterns-microos-desktop-common \
        patterns-dudecake-media \
        patterns-dudecake-games \
        patterns-cosmic-cosmic && \
    zypper clean -a
