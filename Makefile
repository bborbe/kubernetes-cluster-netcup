generate:
	rm -rf scripts kubernetes
	k8s_cluster_generate_configs \
	-logtostderr \
	-v=2 \
	-config cluster-config.json
install:
	go install github.com/bborbe/kubernetes_tools/bin/k8s_cluster_generate_configs
download:
	go get -u github.com/bborbe/kubernetes_tools/bin/k8s_cluster_generate_configs
copy:
	cp kubernetes/config/openstack/latest/user_data /var/lib/coreos-install/user_data
restart:
	systemctl stop kubelet
	systemctl stop docker
	coreos-cloudinit -from-file=/var/lib/coreos-install/user_data
