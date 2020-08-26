.DEFAULT_GOAL := help
.PHONY: help

help:
	@grep -E '(^[0-9a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-25s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

##---------------------------------------------------------------------------
## Get Started
##---------------------------------------------------------------------------

install: ## Install dependencies
	npm install .

##---------------------------------------------------------------------------
## Docker
##---------------------------------------------------------------------------

build: ## Build Docker Image
	docker build -t udagram-api-user .

run: ## Run Docker Image
	docker run -it -p 8082:8082 --env-file ./.env --name udagram-api-user-service --network udagram-network udagram-api-user

push-image: ## Push Image to the Docker Hub
	docker tag udagram-api-user nass59/udagram-api-user:latest
	docker push nass59/udagram-api-user