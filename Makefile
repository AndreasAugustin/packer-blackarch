SHELL := /bin/bash
.DEFAULT_GOAL := help

###########################
# TARGETS
###########################

.PHONY: help
help:  ## help target to show available commands with information
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) |  awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: bootstrap
bootstrap: ## Build Container
	docker-compose run node npm ci

.PHONY: shell
shell: ## Open shell with packer dependencies installed in zsh
	docker-compose run --entrypoint /bin/zsh packer
