NAME = skilldlabs/tunnel
TAG ?= test

PLATFORM ?= linux/amd64,linux/arm64
PUSH=

.PHONY: all build push

all: build push

build:
	set -e; printf "\nBuilding $(NAME):$(TAG) \n\n"; \
		docker buildx build -t $(NAME):$(TAG) \
		--platform $(PLATFORM) \
		--no-cache --progress=plain $(PUSH) \
		--build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
		--build-arg VCS_REF=`git rev-parse --short HEAD` \
		.

push:
	set -e; printf "\nPushing $(NAME):$(TAG) \n\n";
	$(MAKE) build PUSH='--push'
