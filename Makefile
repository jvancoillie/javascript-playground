# Setup ————————————————————————————————————————————————————————————————————————————————————————————————————————————————
PROJECT    = javascript-playground
PWD = $(shell pwd)

.SILENT:
.DEFAULT_GOAL := help

# Colors
COLOR_RESET   = \033[0m
COLOR_INFO    = \033[32m
COLOR_COMMENT = \033[33m

.DEFAULT_GOAL := help

## —— Make file ————————————————————————————————————————————————————————————————————————————————————————————
help: ## Outputs this help screen
	@grep -E '(^[a-zA-Z\-\_0-9\.@]+:.*?##.*$$)|(^##)' $(firstword  $(MAKEFILE_LIST)) | awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'


## —— Docker ———————————————————————————————————————————————————————————————————————————————————————————————


# DOCKER TASKS
# Build the container
build: ## Build the container
	docker build -t $(PROJECT) .

run: ## Run container on port configured in `config.env`
	docker run -i -t --rm -v $(PWD):/usr/src/app  --name="$(PROJECT)" $(PROJECT) /bin/bash

up: build run ## Run bash in container

stop: ## Stop and remove a running container
	docker stop $(PROJECT); docker rm $(PROJECT)

