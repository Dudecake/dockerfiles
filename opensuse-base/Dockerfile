FROM registry.opensuse.org/opensuse/tumbleweed:latest

RUN zypper addrepo -fp120 https://download.opensuse.org/repositories/home:dudecake/openSUSE_Tumbleweed/home:dudecake.repo && \
    zypper addrepo -fp120 https://download.opensuse.org/repositories/security:idm/openSUSE_Tumbleweed/security:idm.repo && \
    zypper addrepo -fp120 https://download.opensuse.org/repositories/security/openSUSE_Tumbleweed/security.repo && \
    zypper addrepo -fp120 https://download.opensuse.org/repositories/shells:zsh-users:zsh-syntax-highlighting/openSUSE_Tumbleweed/shells:zsh-users:zsh-syntax-highlighting.repo && \
    zypper addlock kernel-vanilla\* kernel-source-vanilla\* python311\* python312\* && \
    zypper --gpg-auto-import-keys refresh && \
    zypper install -y --force-resolution \
        patterns-microos-base-zypper \
        patterns-microos-hardware \
        sdbootutil-snapper \
        sdbootutil-rpm-scriptlets \
        patterns-dudecake-base-minimal && \
    zypper clean -a
