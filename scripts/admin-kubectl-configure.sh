#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace

SCRIPT_ROOT=$(dirname ${BASH_SOURCE})

mkdir -p $HOME/.kube/netcup
kubectl config set-cluster netcup-cluster --server=https://185.170.112.48:6443 --certificate-authority=$HOME/.kube/netcup/ca.pem
kubectl config set-credentials netcup-admin --certificate-authority=$HOME/.kube/netcup/ca.pem --client-key=$HOME/.kube/netcup/admin-key.pem --client-certificate=$HOME/.kube/netcup/admin.pem
kubectl config set-context netcup-system --cluster=netcup-cluster --user=netcup-admin
kubectl config use-context netcup-system

echo "test with 'kubectl get nodes'"
