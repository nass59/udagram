.DEFAULT_GOAL := help
.PHONY: help

APP_NAME := udagram-reverse-proxy
DOCKER_USERNAME := nass59
DOCKER_NETWORK := udagram-network
DOCKER_PORT := 8080:8080
K8S_LABEL_APP := backend

help:
	@grep -E '(^[0-9a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-25s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

##---------------------------------------------------------------------------
## Docker
##---------------------------------------------------------------------------

build: ## Build Docker Image
	docker build -t $(APP_NAME) .

run: ## Run Docker Image
	docker run -d -p $(DOCKER_PORT) --env-file ./.env --name $(APP_NAME) --network $(DOCKER_NETWORK) $(APP_NAME)

push-image: ## Push Image to the Docker Hub
	docker tag $(APP_NAME) $(DOCKER_USERNAME)/$(APP_NAME):latest
	docker push $(DOCKER_USERNAME)/$(APP_NAME)

##---------------------------------------------------------------------------
## k8s
##---------------------------------------------------------------------------

k8s-deploy: ## Deploy k8s
	kubectl apply -f ./k8s/deployment.yaml
	kubectl apply -f ./k8s/service.yaml

k8s-delete: ## Delete Deployment/Service
	kubectl delete deployment $(APP_NAME)
	kubectl delete service $(APP_NAME)

k8s-pods: ## Get Pods
	kubectl get pods -l app=$(K8S_LABEL_APP),tier=$(APP_NAME)

k8s-describe-pods: ## Describe Pods
	kubectl describe pods -l app=$(K8S_LABEL_APP),tier=$(APP_NAME)

k8s-services: ## Get Services
	kubectl get services -l app=$(K8S_LABEL_APP),tier=$(APP_NAME)

k8s-service: ## Get current Service
	kubectl get service $(APP_NAME)

k8s-describe-services: ## Describe Services
	kubectl describe services -l app=$(K8S_LABEL_APP),tier=$(APP_NAME)

k8s-describe-service: ## Describe current Service
	kubectl describe service $(APP_NAME)

k8s-autoscale: ## Enable autoscale
	kubectl autoscale deployment $(APP_NAME) --cpu-percent=50 --min=1 --max=10