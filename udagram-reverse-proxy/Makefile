.DEFAULT_GOAL := help
.PHONY: help

help:
	@grep -E '(^[0-9a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-25s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

##---------------------------------------------------------------------------
## Docker
##---------------------------------------------------------------------------

build: ## Build Docker Image
	docker build -t udagram-reverse-proxy .

run: ## Run Docker Image
	docker run -d -p 8080:8080 --name udagram-reverse-proxy-service --network udagram-network udagram-reverse-proxy

push-image: ## Push Image to the Docker Hub
	docker tag udagram-reverse-proxy nass59/udagram-reverse-proxy:latest
	docker push nass59/udagram-reverse-proxy