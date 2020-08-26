.DEFAULT_GOAL := help
.PHONY: help

help:
	@grep -E '(^[0-9a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-25s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

##---------------------------------------------------------------------------
## Get Started
##---------------------------------------------------------------------------

install: ## Install dependencies
	npm install .
	ionic build
	ionic serve

serve:
	ionic serve
	
##---------------------------------------------------------------------------
## Docker
##---------------------------------------------------------------------------

build: ## Build Docker Image
	docker build -t udagram-frontend .

run: ## Run Docker Image
	docker run -it -p 8100:80 --name udagram-frontend-service --network udagram-network udagram-frontend

push-image: ## Push Image to the Docker Hub
	docker tag udagram-frontend nass59/udagram-frontend:latest
	docker push nass59/udagram-frontend