.DEFAULT_GOAL := help
.PHONY: help
help:
	@awk 'BEGIN {FS = ":.*##"} /^([a-zA-Z0-9_-]|\/)+:.*?##/ { printf "  \033[34m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ Docker

docker/network/create: ## Create Docker network
	docker network create toolbox

docker/build/python-devcontainer: ## Build Python devcontainer Docker image
	UID=$(shell id -u) GID=$(shell id -g) docker compose -f compose.yml build python-devcontainer

docker/run/all: ## Run all containers
	UID=$(shell id -u) GID=$(shell id -g) docker compose -f compose.yml up -d

docker/stop/all: ## Stop all containers
	docker compose -f compose.yml down

docker/run/python-devcontainer: ## Run Python devcontainer
	UID=$(shell id -u) GID=$(shell id -g) docker compose -f compose.yml up -d python-devcontainer

docker/stop/python-devcontainer: ## Stop Python devcontainer
	docker compose -f compose.yml down python-devcontainer

docker/run/postgres: ## Run Postgres service in Docker compose
	docker compose -f compose.yml up -d postgres

docker/stop/postgres: ## Stop Python devcontainer
	docker compose -f compose.yml down postgres