#!/bin/bash

reg_runner () {
  REG_TOKEN=$(curl -X POST \
                   -s "https://api.github.com/repos/${ACCOUNT}/${REPO}/actions/runners/registration-token" \
                   -H "Accept: application/vnd.github.v3+json" \
                   -H "Authorization: token ${ACCESS_TOKEN}" \
            | grep -Po '"token": "\K.*?(?=")')

  if [ -z "${RUNNER_NAME}" ]; then
    export RUNNER_NAME="${HOSTNAME}"
  fi

  ./config.sh --url "https://github.com/${ACCOUNT}/${REPO}" \
              --token "${REG_TOKEN}" \
              --name "${RUNNER_NAME}" \
              --unattended
}

if [ -f ".runner" ]; then
  ./run.sh
else
  if [ -z "${ACCESS_TOKEN}" ]; then
    echo "ERROR: Set the \$ACCESS_TOKEN."
    exit 1
  fi

  if [ -z "${ACCOUNT}" ]; then
    echo "ERROR: Set the \$ACCOUNT."
    exit 1
  fi

  if [ -z "${REPO}" ]; then
    echo "ERROR: Set the \$REPO."
    exit 1
  fi 

  reg_runner && ./run.sh
fi
