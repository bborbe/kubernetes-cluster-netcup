#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace

SCRIPT_ROOT=$(dirname ${BASH_SOURCE})


mkdir -p /etc/kubernetes/ssl
cp ${SCRIPT_ROOT}/ca.pem /etc/kubernetes/ssl/ca.pem
cp ${SCRIPT_ROOT}/kubernetes.pem /etc/kubernetes/ssl/node.pem
cp ${SCRIPT_ROOT}/kubernetes-key.pem /etc/kubernetes/ssl/node-key.pem
chown root:root /etc/kubernetes/ssl/*.pem

