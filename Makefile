create-local-cluster:
	kind create cluster --config ./infrastructure/cluster-config.yaml

install-argocd:
	kubectl create namespace argocd
	helm repo add argo https://argoproj.github.io/argo-helm	
	helm dependency build ./charts/argocd
	helm upgrade --install argocd ./charts/argocd -n argocd --wait

install-app-of-apps:
	helm upgrade --install argocd ./charts/app-of-apps

setup: create-local-cluster install-argocd

clear:
	kind delete clusters local-kubernetes