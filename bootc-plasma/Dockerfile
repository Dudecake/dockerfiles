FROM registry.opensuse.org/opensuse/tumbleweed:latest

LABEL containers.bootc 1

RUN zypper addrepo -fp120 https://download.opensuse.org/repositories/home:dudecake/openSUSE_Tumbleweed/home:dudecake.repo && \
    zypper addrepo -fp120 https://download.opensuse.org/repositories/security:idm/openSUSE_Tumbleweed/security:idm.repo && \
    zypper addrepo -fp120 https://download.opensuse.org/repositories/security/openSUSE_Tumbleweed/security.repo && \
    zypper addrepo -fp120 https://download.opensuse.org/repositories/shells:zsh-users:zsh-syntax-highlighting/openSUSE_Tumbleweed/shells:zsh-users:zsh-syntax-highlighting.repo && \
    zypper addlock kernel-vanilla\* kernel-source-vanilla\* python311\* python312\* busybox && \
    zypper --gpg-auto-import-keys refresh && \
    zypper install -y \
        patterns-dudecake-base-minimal \
        patterns-dudecake-hw-accel && \
    zypper clean -a

    RUN zypper addrepo -fp120 https://download.opensuse.org/repositories/home:cloud-hypervisor/openSUSE_Tumbleweed/home:cloud-hypervisor.repo && \
    zypper addrepo -fp120 https://download.opensuse.org/repositories/Virtualization:containers/openSUSE_Tumbleweed/Virtualization:containers.repo && \
    echo -e '[virtio-win-latest]\nname=Latest virtio-win builds\nenabled=1\nautorefresh=1\nbaseurl=http://fedorapeople.org/groups/virt/virtio-win/repo/latest\ngpgcheck=0\npriority=120' > /etc/zypp/repos.d/virtio-win-latest.repo && \
    zypper --gpg-auto-import-keys refresh && \
    zypper install -y \
        patterns-dudecake-virtualization \
        bootc \
        dracut \
        rsync \
        dudecake-config-bootc && \
    zypper clean -a

RUN rsync --remove-source-files /opt /var/opt/. && \
    rmdir /opt && \
    ln -s var/opt /opt && \
    rsync --remove-source-files /root /var/roothome/. && \
    rm -rf /root && \
    ln -s var/roothome /root && \
    rsync --remove-source-files /home /var/home/. && \
    rmdir /home && \
    ln -s var/home /home && \
    sh -c 'export KERNEL_VERSION="$(basename "$(find /usr/lib/modules -mindepth 1 -maxdepth 1)")" && \
        dracut --no-hostonly --force-drivers erofs --reproducible --zstd --verbose --kver "$KERNEL_VERSION"  "/usr/lib/modules/$KERNEL_VERSION/initramfs.img"'

RUN zypper addrepo -fp120 https://download.opensuse.org/repositories/editors/openSUSE_Tumbleweed/editors.repo && \
    zypper addrepo -fp120 https://download.opensuse.org/repositories/home:dudecake:compat/openSUSE_Tumbleweed/home:dudecake:compat.repo && \
    echo -e '[vscode]\nname=Visual Studio Code\nenabled=1\nautorefresh=1\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc\npriority=120' > /etc/zypp/repos.d/vscode.repo && \
    zypper --gpg-auto-import-keys refresh && \
    zypper install -y --force-resolution \
        patterns-dudecake-desktop-applications && \
    zypper clean -a

RUN zypper addrepo -fp120 https://download.opensuse.org/repositories/Emulators/openSUSE_Tumbleweed/Emulators.repo && \
    zypper addrepo -fp120 https://download.opensuse.org/repositories/games/openSUSE_Tumbleweed/games.repo && \
    zypper --gpg-auto-import-keys refresh && \
    zypper install -y --force-resolution \
        # patterns-microos-desktop-kde \
        patterns-dudecake-media \
        patterns-dudecake-games \
        patterns-dudecake-plasma && \
    zypper clean -a
