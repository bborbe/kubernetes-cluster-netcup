#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace

SCRIPT_ROOT=$(dirname ${BASH_SOURCE})

mkdir -p ~/.kube/netcup

scp v22016124049440903.goodsrv.de:/kubernetes-cluster-nc/scripts/ca.pem ~/.kube/netcup/
scp v22016124049440903.goodsrv.de:/kubernetes-cluster-nc/scripts/admin.pem ~/.kube/netcup/
scp v22016124049440903.goodsrv.de:/kubernetes-cluster-nc/scripts/admin-key.pem ~/.kube/netcup/
