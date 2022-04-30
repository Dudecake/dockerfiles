FROM registry.fedoraproject.org/fedora:35

ENV RUNNER_VERSION=2.284.0

ADD runner-entrypoint.sh /entrypoint.sh

RUN bash -c 'dnf shell -y <(printf "%s\n" "update" "install git dnf-plugins-core rpmdevtools lttng-ust openssl-libs krb5-libs zlib libicu gcc make autoconf automake libtool rpm-build libtirpc-devel libblkid-devel libuuid-devel libudev-devel openssl-devel zlib-devel libaio-devel libattr-devel elfutils-libelf-devel kernel-devel python39 python39-devel python-setuptools python-cffi libffi-devel ncompress" "run")' && \
    dnf clean all && \
    useradd -md /runner -G mock -u 9001 runner && \
    /entrypoint.sh --init

USER runner:runner

ENTRYPOINT /entrypoint.sh
