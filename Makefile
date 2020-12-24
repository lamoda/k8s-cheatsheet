KUBECONFIG?=$(HOME)/.kube/config

build-image:
	docker build -t kubectl-client:latest .

run-image:
	echo $(KUBECONFIG)
	docker run --rm -v "${KUBECONFIG}":/root/.kube/config -it \
	kubectl-client:latest sh