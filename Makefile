# VirtualEnv vars
# SERVICE ?= intake
SOURCE := lambda
# SOURCEFILE := $(SOURCE)

dependencies: 
	pip install -r $(SOURCE)/requirements.txt -t $(SOURCE)


build: dependencies
	$(eval VERSION=$(shell git rev-parse --short HEAD))
	cd $(SOURCE) && zip -x '*__pychache__*' -x '*.pyc' -r fin-stopper-$(VERSION).zip .

ci_build: dependencies
	cd $(SOURCE) && zip -x '*__pychache__*' -x '*.pyc' -r fin-stopper-${VERSION}.zip .

clean: ## -> Deletes current virtual env environment
	$(info "[-] Who needs all that anyway? Destroying environment....")
	rm -rf ./*.zip

upload:
	aws s3 cp lambda/fin-stopper-*.zip s3://ascending-devops/fin/

deploy:
	aws cloudformation update-stack --stack-name ${STACK_NAME} --use-previous-template --parameters ParameterKey=DatabaseName,UsePreviousValue=true ParameterKey=DatabaseUser,UsePreviousValue=true ParameterKey=DatabasePassword,UsePreviousValue=true ParameterKey=SendgridKey,UsePreviousValue=true ParameterKey=SecurityStack,UsePreviousValue=true ParameterKey=PublicSubnets,UsePreviousValue=true ParameterKey=ZipVersion,ParameterValue=${VERSION} --capabilities CAPABILITY_NAMED_IAM