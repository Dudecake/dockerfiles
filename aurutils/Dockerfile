FROM archlinux:latest

VOLUME /pkgs

RUN pacman -Syu --noconfirm --needed base-devel jq pacutils git wget shellcheck vim vifm devtools bash-completion man-db man-pages expect && \
    ln -fs /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime && \
    useradd -m -G wheel aurutils && \
    echo aurutils:aurutils | chpasswd && \
    chown aurutils:wheel /pkgs && \
    echo 'aurutils ALL=(ALL:ALL) NOPASSWD: ALL' > /etc/sudoers.d/aurutils && \
    sed -i 's/arch=x86-64/arch=x86-64-v3/' /etc/makepkg.conf && \
    sudo -u aurutils sh -c '(git clone https://aur.archlinux.org/aurutils.git /tmp/aurutils && cd /tmp/aurutils && makepkg -i --noconfirm)' && \
    pacman -Scc --noconfirm

USER aurutils:wheel
