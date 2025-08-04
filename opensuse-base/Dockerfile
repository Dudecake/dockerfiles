FROM registry.opensuse.org/opensuse/tumbleweed:latest

RUN zypper addrepo -p120 https://download.opensuse.org/repositories/home:dudecake/openSUSE_Tumbleweed/home:dudecake.repo && \
    zypper addrepo -p120 https://download.opensuse.org/repositories/security:idm/openSUSE_Tumbleweed/security:idm.repo && \
    zypper addrepo -p120 https://download.opensuse.org/repositories/security/openSUSE_Tumbleweed/security.repo && \
    zypper addrepo -p120 https://download.opensuse.org/repositories/shells:zsh-users:zsh-syntax-highlighting/openSUSE_Tumbleweed/shells:zsh-users:zsh-syntax-highlighting.repo && \
    zypper --gpg-auto-import-keys refresh && \
    zypper install -y --force-resolution patterns-microos-base-zypper patterns-microos-hardware patterns-microos-selinux patterns-dudecake-base && \
    zypper clean -a
