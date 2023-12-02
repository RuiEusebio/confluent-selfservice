create-local-cluster:
	kind create cluster --config ./infrastructure/cluster-config.yaml

install-argocd:
	kubectl create namespace argocd
	helm dependency build ./charts/argocd
	helm upgrade --install argocd ./charts/argocd -n argocd
	kubectl apply -f ./charts/argocd

install-app-of-apps:
	helm upgrade --install argocd ./charts/app-of-apps

setup: create-local-cluster install-argocd install-app-of-apps

clean:
	kind delete clusters local-kubernetes