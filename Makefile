.DEFAULT_GOAL := help
.PHONY: help

help:
	@grep -E '(^[0-9a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-25s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

API_FEED := udagram-api-feed
API_USER := udagram-api-user
REVERSE_PROXY := udagram-reverse-proxy
FRONTEND := udagram-frontend
DOCKER_USERNAME := nass59

##---------------------------------------------------------------------------
## Docker
##---------------------------------------------------------------------------

build-images: ## Build Images
	cd ./$(API_FEED) && make build
	cd ./$(API_USER) && make build
	cd ./$(REVERSE_PROXY) && make build
	cd ./$(FRONTEND) && make build-prod

push-images: ## Push Images
	cd ./$(API_FEED) && make push-image
	cd ./$(API_USER) && make push-image
	cd ./$(REVERSE_PROXY) && make push-image
	cd ./$(FRONTEND) && make push-image

run: ## Run Images
	cd ./$(API_FEED) && make run
	cd ./$(API_USER) && make run
	cd ./$(REVERSE_PROXY) && make run
	cd ./$(FRONTEND) && make run

##---------------------------------------------------------------------------
## k8s
##---------------------------------------------------------------------------

k8s-set-env: ## Set Env Variables
	cp k8s/env-secret.yaml.dist k8s/env-secret.yaml
	cp k8s/aws-secret.yaml.dist k8s/aws-secret.yaml
	sed -i '' "s/{{AWS_BUCKET}}/${AWS_BUCKET}/g;s/{{AWS_PROFILE}}/${AWS_PROFILE}/g;s/{{AWS_REGION}}/${AWS_REGION}/g;" k8s/env-secret.yaml
	sed -i '' "s/{{POSTGRES_USERNAME}}/${POSTGRES_USERNAME}/g;s/{{POSTGRES_PASSWORD}}/${POSTGRES_PASSWORD}/g;s/{{POSTGRES_HOST}}/${POSTGRES_HOST}/g;" k8s/env-secret.yaml
	sed -i '' "s/{{JWT_SECRET}}/${JWT_SECRET}/g;" k8s/env-secret.yaml
	sed -i '' "s/{{AWS_CREDENTIALS}}/${AWS_CREDENTIALS}/g;" k8s/aws-secret.yaml

k8s-env: ## Add Env Variables to k8s
	kubectl apply -f ./k8s/env-secret.yaml
	kubectl apply -f ./k8s/aws-secret.yaml
	kubectl apply -f ./k8s/env-configmap.yaml

k8s-deploy: ## Deploy Deployments and Services to EKS
	cd ./$(API_FEED) && make k8s-deploy
	cd ./$(API_USER) && make k8s-deploy
	cd ./$(REVERSE_PROXY) && make k8s-deploy
	cd ./$(FRONTEND) && make k8s-deploy

k8s-deploy-images: ## Deploy new images
	kubectl set image deployments/$(API_FEED) $(API_FEED)=$(DOCKER_USERNAME)/$(API_FEED):latest
	kubectl set image deployments/$(API_USER) $(API_USER)=$(DOCKER_USERNAME)/$(API_USER):latest
	kubectl set image deployments/$(REVERSE_PROXY) $(REVERSE_PROXY)=$(DOCKER_USERNAME)/$(REVERSE_PROXY):latest
	kubectl set image deployments/$(FRONTEND) $(FRONTEND)=$(DOCKER_USERNAME)/$(FRONTEND):latest