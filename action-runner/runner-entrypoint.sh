#!/bin/sh

if [[ "$1" = "--init" ]]; then
  ARCH=$(uname -m)
  [[ "${ARCH}" = "x86_64" ]] && ARCH="x64"
  [[ "${ARCH}" = "aarch64" ]] && ARCH="arm64"
  exec curl -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-${ARCH}-${RUNNER_VERSION}.tar.gz | tar -xzf - -C /runner
else
  # check if configured
  /runner/config.sh --unattended --url "${RUNNER_URL}" --token "${RUNNER_TOKEN}"
  exec /runner/run.sh
fi
