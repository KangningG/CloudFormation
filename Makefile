# VirtualEnv vars
# SERVICE ?= intake
SOURCE := src
RELEASE := release
# SOURCEFILE := $(SOURCE)

PHONY: build

dependencies:
	# pip install -r $(SOURCE)/requirements.txt -t $(SOURCE)
	pip install -r $(SOURCE)/requirements.txt -t $(SOURCE)

build: # dependencies
	$(shell test ! -d "./$(RELEASE)" && mkdir "$(RELEASE)")
	$(eval VERSION=$(shell git rev-parse --short HEAD))
	cd $(SOURCE) && zip -x '*__pychache__*' -x '*.pyc' -r ../release/sample-$(VERSION).zip .


clean: ## -> Deletes current virtual env environment
	$(info "[-] Who needs all that anyway? Destroying environment....")
	rm -rf ./$(RELEASE)/*.zip