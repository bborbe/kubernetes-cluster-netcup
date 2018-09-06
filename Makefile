generate:
	rm -rf scripts kubernetes
	k8s-cluster-generate-configs \
	-logtostderr \
	-v=2 \
	-config cluster-config.json
install:
	go install github.com/bborbe/k8s-cluster-generate-configs
download:
	go get -u github.com/bborbe/k8s-cluster-generate-configs
copy:
	cp kubernetes/config/openstack/latest/user_data /var/lib/coreos-install/user_data
restart:
	systemctl stop kubelet
	systemctl stop docker
	coreos-cloudinit -from-file=/var/lib/coreos-install/user_data
