create-local-cluster:
	kind create cluster --config ./infrastructure/cluster-config.yaml

install-argocd:
	kubectl create namespace argocd
	helm dependency build ./charts/argocd
	helm upgrade --install argocd ./charts/argocd -n argocd

setup: create-local-cluster install-argocd

clean:
	kind delete clusters local-kubernetes