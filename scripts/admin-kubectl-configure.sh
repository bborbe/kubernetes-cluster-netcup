#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace

SCRIPT_ROOT=$(dirname ${BASH_SOURCE})

mkdir -p $HOME/.kube/nc
kubectl config set-cluster nc-cluster --server=https://185.170.112.48:6443 --certificate-authority=$HOME/.kube/nc/ca.pem
kubectl config set-credentials nc-admin --certificate-authority=$HOME/.kube/nc/ca.pem --client-key=$HOME/.kube/nc/admin-key.pem --client-certificate=$HOME/.kube/nc/admin.pem
kubectl config set-context nc-system --cluster=nc-cluster --user=nc-admin
kubectl config use-context nc-system

echo "test with 'kubectl get nodes'"
