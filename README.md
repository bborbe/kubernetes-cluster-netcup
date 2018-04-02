# Kubernetes Cluster Configuration

## Update cluster

```
ssh v22016124049440903.goodsrv.de
sudo -s
cd /kubernetes-cluster-nc
git pull
cp kubernetes/config/openstack/latest/user_data /var/lib/coreos-install/user_data
systemctl stop kubelet
systemctl stop docker
coreos-cloudinit -from-file=/var/lib/coreos-install/user_data
```
