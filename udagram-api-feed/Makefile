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
	docker build -t udagram-api-feed .

run: ## Run Docker Image
	docker run -it -p 8081:8081 --env-file ./.env --name udagram-api-feed-service --network udagram-network -v ${HOME}/.aws/credentials:/root/.aws/credentials:ro udagram-api-feed

push-image: ## Push Image to the Docker Hub
	docker tag udagram-api-feed nass59/udagram-api-feed:latest
	docker push nass59/udagram-api-feed

