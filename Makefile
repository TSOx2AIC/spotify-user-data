.PHONY: build
## build: builds the docker image
build:
		docker build . -t spotify-user-data

.PHONY: run
## run: runs the docker container
run:
		docker run -p 8888:8888 -d spotify-user-data --name spotify-user-data

.PHONY: help
## help: prints this help message
help:
		@echo "Usage: \n"
		@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'
