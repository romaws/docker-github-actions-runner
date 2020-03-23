FROM debian:buster-20200224-slim

ENV RUNNER_VERSION=2.165.2
ENV RUNNER_ALLOW_RUNASROOT=1
ENV RUNNER_PATH=/actions-runner

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install --no-install-recommends -y \
        ca-certificates \
        curl \
        git \
        liblttng-ust0 \
        libkrb5-3 \
        zlib1g \
        libssl1.1 \
        libicu63

RUN mkdir -p "${RUNNER_PATH}" \
    && cd "${RUNNER_PATH}" \
    # If you want always the last version
    # && export RUNNER_VERSION=$(curl -s https://api.github.com/repos/actions/runner/releases/latest | grep -Po '"tag_name": "v\K.*?(?=")' \
    && curl -L -O "https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz" \
    && tar -zxf "actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz" \
    && rm "actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz"

WORKDIR "${RUNNER_PATH}"
COPY entrypoint.sh "${RUNNER_PATH}"
ENTRYPOINT ["./entrypoint.sh"]
