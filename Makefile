DOCKER_REGISTRY=europe-west1-docker.pkg.dev/tsox2aic/tsox2aic
IMAGE_NAME=spotify-user-data
SERVICE_NAME=spotify-user-data
REGION=europe-west1

.PHONY: build
## build: builds the docker image
build:
		docker build . -t ${IMAGE_NAME}

.PHONY: run
## run: runs the docker container
run:
		docker run -p 8888:8888 -d ${IMAGE_NAME} --name ${IMAGE_NAME}

.PHONY: push
## push: pushes the docker image to the cloud artifact registry
push:
		docker tag ${IMAGE_NAME} ${DOCKER_REGISTRY}/${IMAGE_NAME}
		docker push ${DOCKER_REGISTRY}/${IMAGE_NAME}


.PHONY: deploy
## deploy: deploys the latest docker image to cloud run
deploy:
		gcloud run deploy ${SERVICE_NAME} --image ${DOCKER_REGISTRY}/${IMAGE_NAME} --region ${REGION}

.PHONY: help
## help: prints this help message
help:
		@echo "Usage: \n"
		@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'