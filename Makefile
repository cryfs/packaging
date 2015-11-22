.PHONY: all packages machines

REPOSITORY := "https://github.com/cryfs/cryfs"
TAG := "0.8.2"

all: packages

DOCKERFILES := $(shell find docker -name "*.dockerfile")

# -------------------------------------------------------------------------------
# Build docker containers for the operating systems we want to build packages for
# -------------------------------------------------------------------------------

CONTAINERTARGETS := $(DOCKERFILES:.dockerfile=.image)

containers: $(CONTAINERTARGETS)

docker/%.image: docker/%.dockerfile
	docker build -t cryfs/$* -f $< docker

# -------------------------------------
# Build packages using these containers
# -------------------------------------

PACKAGETARGETS := $(addprefix build/,$(DOCKERFILES:.dockerfile=.deb))

packages: $(PACKAGETARGETS)

build/%.deb: docker/%.image
	docker run cryfs/$* $(REPOSITORY) $(TAG) > $@
