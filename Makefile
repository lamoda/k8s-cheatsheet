KUBECONFIG?=$(HOME)/.kube/config
KUBE_VERSION?=1.21.0

build-image:
	docker build --build-arg KUBE_VERSION=${KUBE_VERSION} -t kubectl-client:latest .

run-image:
	echo $(KUBECONFIG)
	docker run --rm -v "${KUBECONFIG}":/root/.kube/config:ro -it \
	kubectl-client:latest bash
