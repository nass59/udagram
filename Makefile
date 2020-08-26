.DEFAULT_GOAL := help
.PHONY: help

help:
	@grep -E '(^[0-9a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-25s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

##---------------------------------------------------------------------------
## Get Started
##---------------------------------------------------------------------------

build-images: ## Build Images
	cd ./udagram-api-feed && make build
	cd ./udagram-api-user && make build
	cd ./udagram-reverse-proxy && make build
	cd ./udagram-frontend && make build

push-images: ## Push Images
	cd ./udagram-api-feed && make push-image
	cd ./udagram-api-user && make push-image
	cd ./udagram-reverse-proxy && make push-image
	cd ./udagram-frontend && make push-image

run: ## Run Images
	cd ./udagram-api-feed && make run
	cd ./udagram-api-user && make run
	cd ./udagram-reverse-proxy && make run
	cd ./udagram-frontend && make run